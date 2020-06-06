import 'package:flutter/material.dart';
import 'package:flutter_eyes/constants/font_type.dart';
import 'package:flutter_eyes/model/model.dart';
import 'package:flutter_eyes/utils/image_util.dart';
import 'package:flutter_eyes/utils/screens.dart';
import 'package:flutter_eyes/utils/utils.dart';
import 'package:flutter_eyes/widget/widgets.dart';

import 'item_widget.dart';

///头像 标题 简洁 时间
///[isAuthor] 作者  头像 标题 简介 follow
class ItemHeaderWidget extends StatelessWidget {
  const ItemHeaderWidget({Key key, this.header, this.isAuthor = false})
      : super(key: key);
  final Header header;
  final bool isAuthor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
//        divider,
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: setWidth(20),
            vertical: setWidth(20),
          ),
          child: isAuthor ? authorWidget() : headerWidget(),
        ),
      ],
    );
  }

  Widget authorWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        iconWidget(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: setWidth(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  header.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: setSp(28),
                  ),
                ),
                SizedBox(height: setHeight(5)),
                Text(
                  header?.description ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: setSp(24),
                    fontFamily: FontType.normal,
                    color: const Color(0xff757575),
                  ),
                ),
              ],
            ),
          ),
        ),
        followWidget(color: Colors.black87),
      ],
    );
  }

  Widget headerWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        iconWidget(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: setWidth(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  header.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: setSp(28),
                  ),
                ),
                SizedBox(height: setHeight(5)),
                Text(
                  header?.description ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: setSp(24),
                    fontFamily: FontType.normal,
                    color: const Color(0xff757575),
                  ),
                ),
              ],
            ),
          ),
        ),
        timeWidget(),
      ],
    );
  }

  Widget iconWidget() {
    if (header.icon != null) {
      Widget res = Glide.loadImage(header.icon);
      if (header.iconType == 'round') {
        res = ClipOval(child: res);
      } else if (header.iconType == 'squareWithPlayButton') {
        ///正方形的一个？
      }
      return SizedBox(
        child: res,
        width: setWidth(90),
        height: setWidth(90),
      );
    }
    return const SizedBox.shrink();
  }

  Widget timeWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: setWidth(30)),
      child: Text(
        getTimeStr(DateTime.fromMillisecondsSinceEpoch(header.time)),
        style: TextStyle(
          fontSize: setSp(20),
          color: const Color(0xff757575),
          fontFamily: FontType.normal,
        ),
      ),
    );
  }
}

///分类  标题 简介 关注
class ItemSort extends StatelessWidget {
  const ItemSort({Key key, this.header}) : super(key: key);
  final Header header;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: setHeight(20),
        horizontal: setWidth(30),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Column(
            children: <Widget>[
              Text(
                header?.title ?? '',
                style: TextStyle(
                  fontSize: setSp(30),
                  fontFamily: FontType.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: setHeight(8)),
              Text(
                header?.subTitle ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: setSp(26),
                  color: Colors.black54,
                ),
              ),
            ],
          )),
          followWidget(
            color: Colors.black87,
          ),
        ],
      ),
    );
  }
}
