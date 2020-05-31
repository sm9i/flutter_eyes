import 'package:flutter/material.dart';
import 'package:flutter_eyes/common/application.dart';
import 'package:flutter_eyes/constants/font_type.dart';
import 'package:flutter_eyes/model/model.dart';
import 'package:flutter_eyes/ui/video/video_page.dart';
import 'package:flutter_eyes/utils/image_util.dart';
import 'package:flutter_eyes/utils/screens.dart';
import 'package:flutter_eyes/utils/utils.dart';
import 'package:flutter_eyes/widget/button/throttle_btn.dart';

class HomeItemWidget extends StatefulWidget {
  const HomeItemWidget({Key key, this.contentInfo}) : super(key: key);
  final ContentInfo contentInfo;

  @override
  _HomeItemWidgetState createState() => _HomeItemWidgetState();
}

class _HomeItemWidgetState extends State<HomeItemWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.33,
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Glide.loadImage(
                        widget.contentInfo.content.data.cover.feed,
                        fit: BoxFit.cover),
                  ),
                  if (widget.contentInfo.content.data.library == 'DAILY')
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
            AuthorWidget(
              header: widget.contentInfo.header,
            ),
          ],
        ),

    );
  }
}

class AuthorWidget extends StatelessWidget {
  const AuthorWidget({Key key, this.header}) : super(key: key);
  final Header header;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: setWidth(20),
        vertical: setWidth(20),
      ),
      child: Row(
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
                    getSubTitle(),
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
      ),
    );
  }

  String getSubTitle() {
    return header.description;
  }

  Widget iconWidget() {
    return SizedBox(
      width: setWidth(100),
      height: setWidth(100),
      child: ClipOval(
        child: Glide.loadImage(
          header.icon,
        ),
      ),
    );
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
