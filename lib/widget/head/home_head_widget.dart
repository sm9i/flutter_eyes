import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eyes/constants/constants.dart';
import 'package:flutter_eyes/constants/font_type.dart';
import 'package:flutter_eyes/model/model.dart';
import 'package:flutter_eyes/utils/screens.dart';
import 'package:flutter_eyes/widget/head/head_banner.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';
import 'dart:math' as math;

///主页头部widget
class HomeHeadWidget extends StatefulWidget {
  final TopIssue info;

  const HomeHeadWidget({Key key, this.info}) : super(key: key);

  @override
  _HomeHeadWidgetState createState() => _HomeHeadWidgetState();
}

class _HomeHeadWidgetState extends State<HomeHeadWidget> {
  PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PullToRefreshContainer(_builder);
  }

  Widget _builder(PullToRefreshScrollNotificationInfo info) {

    final height = math.min((info?.dragOffset ?? 0.0), 100.0) +
        MediaQuery.of(context).size.height * 0.4;
    //can player
//    if (info?.mode != null) {
//      _controller.stopAutoplay();
//    } else {
//      _controller.startAutoplay();
//    }
    return Container(
      height: height,
      child: Stack(
        children: <Widget>[
          //背景
          Positioned.fill(
            child: HeadBanner(
              controller: _controller,
              images: widget.info.data.itemList
                  .map((m) => m.data.cover.feed)
                  .toList(),
            ),
          ),
          Positioned(
            child: Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
                  print(_controller);
                  return TyperAnimatedTextKit(
//                    key: Key('${DateTime.now()},${_controller.event}'),
                    text: [
                      widget.info.data.itemList[0].data.title
                    ],
                    textStyle: TextStyle(
                      fontFamily: FontType.bold,
                      color: Colors.white,
                      fontSize: setSp(37),
                    ),
                    textAlign: TextAlign.center,
                    isRepeatingAnimation: false,
                    speed: Duration(milliseconds: 50),
                  );
                },
              ),
            ),
            left: 0,
            right: 0,
            bottom: setHeight(50),
          ),
          //文字
          //刷新
        ],
      ),
    );
  }
}
