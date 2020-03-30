import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eyes/constants/configuration.dart';
import 'package:flutter_eyes/constants/constants.dart';
import 'package:flutter_eyes/utils/image_util.dart';
import 'package:flutter_eyes/common/helper.dart';
import 'package:flutter_eyes/utils/screens.dart';
import 'package:flutter_eyes/utils/sp_util.dart';
import 'package:flutter_eyes/utils/utils.dart';

import '../main_page.dart';

class SplashCommonPage extends StatefulWidget {
  final isShowUserAnim;

  const SplashCommonPage({Key key, @required this.isShowUserAnim})
      : super(key: key);

  @override
  _SplashCommonPageState createState() => _SplashCommonPageState();
}

class _SplashCommonPageState extends State<SplashCommonPage>
    with TickerProviderStateMixin {
  final animDuration = Duration(milliseconds: 1600);

  //移动动画
  Animation<double> _moveAnimation;
  AnimationController _moveAnimationController;

  //旋转动画
  AnimationController _rotationAnimationController;

  //文字动画
  Animation _textAnimation;
  AnimationController _textTweenAnimationController;

  String eyeOut = 'ic_eye_white_outer.png';
  String eyeInner = 'ic_eye_white_inner.png';
  Color textColor = Colors.white;

  @override
  void initState() {
    moveAnim();
    rotationAnim();
    textAnim();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isShowUserAnim) _moveAnimationController.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    _moveAnimationController?.dispose();
    _rotationAnimationController?.dispose();
    _textTweenAnimationController?.dispose();
    super.dispose();
  }

  void textAnim() {
    _textTweenAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    ///0xff444444
    _textAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_textTweenAnimationController)
          ..addStatusListener((state) {
            if (state == AnimationStatus.completed) {
              _rotationAnimationController.forward();
            }
          });
  }

  void moveAnim() {
    _moveAnimationController =
        AnimationController(vsync: this, duration: animDuration);
    _moveAnimation = Tween(begin: suSetHeight(200), end: suSetHeight(300))
        .animate(_moveAnimationController)
          ..addListener(() {
            if (_moveAnimationController.lastElapsedDuration != null) {
              final currentTime =
                  _moveAnimationController.lastElapsedDuration.inMilliseconds;
              if (currentTime > 1300 &&
                  currentTime < 2000 &&
                  eyeOut != 'ic_eye_black_outer.png' &&
                  eyeInner != 'ic_eye_black_inner.png') {
                eyeOut = 'ic_eye_black_outer.png';
                eyeInner = 'ic_eye_black_inner.png';
                textColor = Color(0xff444444);
              }
            }
            if (mounted) setState(() {});
          })
          ..addStatusListener((state) {
            if (state == AnimationStatus.completed) {
              //上升完毕后执行旋转内部眼睛动画
              _textTweenAnimationController.forward();
              SpUtil.putBool(Config.isShowUserAnimBool, true);
            }
          });
  }

  void rotationAnim() {
    _rotationAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _rotationAnimationController.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        //主页面
        _goMainPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          backScaleWidget(showAnimation: !widget.isShowUserAnim),
          adWidget(),
          loadWidget(),
          AnimatedBuilder(
            animation: _textAnimation,
            builder: (context, child) {
              return Center(
                child: Text(
                  Constants.forToday,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: suSetSp(24),
                    color: Color.lerp(Colors.transparent, Color(0xff444444),
                        _textAnimation.value),
                    fontFamily: FontType.lobster,
                  ),
                ),
              );
            },
          ),
          if (widget.isShowUserAnim)
            Positioned(
              left: 0,
              right: 0,
              bottom: suSetHeight(40),
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: suSetSp(16),
                  color: Color(0xffB7B9B8),
                ),
                child: Column(
                  children: <Widget>[
                    Text('-  2020/03/31  -'),
                    SizedBox(height: suSetHeight(10)),
                    Text(
                      Constants.todayChose,
                      style: TextStyle(
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget adWidget() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: suSetHeight(40),
      child: DefaultTextStyle(
        style: TextStyle(
          color: Color(0xffB7B9B8),
          fontSize: suSetSp(16),
        ),
        textAlign: TextAlign.center,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: suSetHeight(200)),
              child: Text(
                Constants.openEyesChinese,
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 0.3,
                  fontSize: suSetSp(28),
                ),
              ),
            ),
            Text(
              Constants.adMessageEnglish,
              style: TextStyle(fontFamily: FontType.lobster),
            ),
            SizedBox(
              height: suSetHeight(10),
            ),
            Text(
              Constants.adMessageChinese,
              style: TextStyle(fontFamily: FontType.normal),
            ),
          ],
        ),
      ),
    );
  }

  Widget loadWidget() {
    if (widget.isShowUserAnim) {
      return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: animDuration,
        builder: (context, value, child) {
          return Container(
            color: Color.lerp(Colors.transparent, Colors.white, value),
            child: moveWidget(),
          );
        },
        onEnd: () {},
      );
    } else {
      return moveWidget();
    }
  }

  Widget moveWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: _moveAnimation.value),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: suSetWidth(150),
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Glide.loadAssetIcon(eyeOut),
                  ),
                  RotationTransition(
                    turns: _rotationAnimationController,
                    child: Container(
                      child: Glide.loadAssetIcon(eyeInner),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              Constants.openEyesEnglish,
              style: TextStyle(
                fontSize: suSetSp(24),
                color: textColor,
                fontFamily: FontType.lobster,
              ),
            ),
          ],
        ),
      ),
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
