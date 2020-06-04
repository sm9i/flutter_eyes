import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_eyes/constants/font_type.dart';
import 'package:flutter_eyes/model/model.dart';
import 'package:flutter_eyes/utils/image_util.dart';
import 'package:flutter_eyes/utils/screens.dart';
import 'package:flutter_eyes/utils/theme_util.dart';
import 'package:flutter_eyes/utils/utils.dart';
import 'package:flutter_eyes/widget/banner_widget.dart';

import 'item_header_widget.dart';

///根据type判断返回固定widget
Widget convertWidget(Content content) {
//  print(content.type);
  if (content.type == 'followCard') {
    return FollowItemWidget(contentInfo: content.data);
  } else if (content.type == 'horizontalScrollCard') {
    return HorizontalScrollCardWidget(contentInfo: content.data);
  } else if (content.type == 'textCard') {
    return TextCardWidget(content: content, text: content?.data?.text ?? '');
  } else if (content.type == 'squareCardCollection') {
    return SquareCardCollectionWidget(content: content);
  }
}

///横向list
class SquareCardCollectionWidget extends StatelessWidget {
  const SquareCardCollectionWidget({Key key, this.content}) : super(key: key);
  final Content content;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              vertical: setHeight(25),
            ),
            child: Text(
              content?.data?.header?.title ?? '',
              style: TextStyle(
                color: Colors.black87,
                fontFamily: FontType.bold,
                fontSize: setSp(32),
              ),
            ),
          ),
          Container(
            height: setHeight(280),
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: setWidth(10)),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) {
                return AspectRatio(
                  aspectRatio: 1,
                  child: buildWidget(content.data.itemList[index]),
                );
              },
              separatorBuilder: (_, __) => Container(width: setWidth(10)),
              itemCount: content.data.itemList.length,
            ),
          )
        ],
      ),
    );
  }

  Widget buildWidget(Content content) {
    if (content.type != 'actionCard') {
      return Container(
        child: Stack(
          children: <Widget>[
            Glide.loadImage(content.data.image),
            Text(content.data.title),
          ],
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffEDEEEC),
            width: setWidth(8),
          ),
          color: const Color(0xffFEFFFE),
        ),
        child: Center(
          child: Text(
            '查看全部',
            style: TextStyle(
              fontSize: setSp(28),
              color: Colors.black87,
            ),
          ),
        ),
      );
    }
  }
}

///文字标题
class TextCardWidget extends StatelessWidget {
  const TextCardWidget({Key key, this.content, this.text}) : super(key: key);
  final Content content;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: setHeight(25),
      ),
      alignment: (getType() == 'header1' || getType() == 'header2')
          ? Alignment.center
          : Alignment.centerLeft,
      child: Text(
        text,
        style: _getStyle(),
      ),
    );
  }

  String getType() {
    return content.data.type;
  }

  TextStyle _getStyle() {
    if (getType() == 'header1') {
      return TextStyle(
        color: Colors.black87,
        fontFamily: FontType.lobster,
        fontSize: setSp(32),
      );
    } else if (getType() == 'header2') {
      return TextStyle(
        color: Colors.black87,
        fontFamily: FontType.bold,
        fontSize: setSp(32),
      );
    } else {
      return TextStyle(
        color: Colors.black87,
        fontFamily: FontType.normal,
        fontSize: setSp(32),
      );
    }
  }
}

///banner图
class HorizontalScrollCardWidget extends StatelessWidget {
  const HorizontalScrollCardWidget({Key key, this.contentInfo})
      : super(key: key);
  final ContentInfo contentInfo;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: BannerWidget(
        itemCount: contentInfo.itemList.length,
        itemBuilder: (_, int index) {
          return Glide.loadImage(
            contentInfo.itemList[index].data.image,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}

///主页列表的格式
class FollowItemWidget extends StatelessWidget {
  const FollowItemWidget({Key key, this.contentInfo}) : super(key: key);
  final ContentInfo contentInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          divider,
          AspectRatio(
            aspectRatio: 1.33,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Glide.loadImage(contentInfo.content.data.cover.feed,
                      fit: BoxFit.cover),
                ),
                if (contentInfo.content.data.library == 'DAILY')
                  Positioned(
                    right: setWidth(15),
                    bottom: setWidth(15),
                    width: setWidth(100),
                    child: Glide.loadAssetIcon(
                      'daily_label.png',
                    ),
                  )
              ],
            ),
          ),
          ItemHeaderWidget(
            header: contentInfo.header,
            isHeader: true,
          ),
        ],
      ),
    );
  }
}

Widget get divider => Container(color: ThemeUtil.dividerColor, height: 1);
