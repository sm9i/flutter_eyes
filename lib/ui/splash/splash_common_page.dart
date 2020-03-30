import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eyes/utils/image_util.dart';
import 'package:flutter_eyes/common/helper.dart';
import 'package:video_player/video_player.dart';

import '../main_page.dart';

class SplashCommonPage extends StatefulWidget {
  @override
  _SplashCommonPageState createState() => _SplashCommonPageState();
}

class _SplashCommonPageState extends State<SplashCommonPage>
    with TickerProviderStateMixin {
  final animDuration = Duration(seconds: 2);
  Animation<Offset> moveAnimation;
  AnimationController moveAnimationController;

  @override
  void initState() {
    moveAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    moveAnimation = Tween(begin: Offset(0, 0.1), end: Offset(0, 1.1))
        .animate(moveAnimationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          backScaleWidget(showAnimation: false),
          loadWidget(),
        ],
      ),
    );
  }

  Widget loadWidget() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: animDuration,
      builder: (context, value, child) {
        return Container(
//          color: Color.lerp(Colors.transparent, Colors.white, value),
          child: Center(
            child: moveWidget(),
          ),
        );
      },
      onEnd: () {
        moveAnimationController.forward();
      },
    );
  }

  Widget moveWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Glide.loadAssetIcon(
            'ic_eye_white.png',
          ),
        )
      ],
    );
  }

  Widget backScaleWidget({bool showAnimation = false}) {
    if (showAnimation) {
      return TweenAnimationBuilder<double>(
        tween: Tween(begin: 1, end: 1.08),
        duration: animDuration,
        onEnd: () {
          _goMainPage();
        },
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: backWidget(),
          );
        },
      );
    } else {
      return backWidget();
    }
  }

  Widget backWidget() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Glide.assetsImagePath('landing_background.jpg')),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  _goMainPage() {
    goPageAndKillSelf(MainPage());
  }
}
