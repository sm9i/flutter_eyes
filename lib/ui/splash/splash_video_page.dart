import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eyes/common/helper.dart';
import 'package:flutter_eyes/constants/configuration.dart';
import 'package:flutter_eyes/constants/constants.dart';
import 'package:flutter_eyes/constants/font_type.dart';
import 'package:flutter_eyes/utils/image_util.dart';
import 'package:flutter_eyes/utils/screens.dart';
import 'package:flutter_eyes/utils/sp_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../widget/intercept_vertical_widget.dart';
import '../main_page.dart';

///主页面视频
class SplashVideoPage extends StatefulWidget {
  @override
  _SplashVideoPageState createState() => _SplashVideoPageState();
}

class _SplashVideoPageState extends State<SplashVideoPage>
    with WidgetsBindingObserver {
  VideoPlayerController _videoPlayerController;
  StreamController<int> bottomSloganController = StreamController<int>();

  int sloganCurrentIndex = 0;

  @override
  void initState() {
    SpUtil.putBool(Config.isFirstOpenBool, true);
    _videoPlayerController =
        VideoPlayerController.asset('assets/videos/landing.mp4');
    _videoPlayerController.initialize().then((_) {
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
    });
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    bottomSloganController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InterceptVerticalWidget(
        child: Stack(
          children: <Widget>[
            VideoPlayer(_videoPlayerController),
            centerLogoWidget(),
            bottomFooterWidget(),
            Positioned(
              bottom: ScreenUtil.bottomBarHeight + setHeight(100),
              left: 0,
              right: 0,
              child: StreamBuilder<int>(
                stream: bottomSloganController.stream,
                initialData: sloganCurrentIndex,
                builder: (_, AsyncSnapshot<int> snp) {
                  return Column(
                    children: <Widget>[
                      TyperAnimatedTextKit(
                        key: Key('zh${snp.data}'),
                        text: <String>[Constants.sloganListZh[snp.data]],
                        textStyle: TextStyle(
                          fontFamily: FontType.bold,
                          color: Colors.white,
                          fontSize: setSp(23),
                        ),
                        textAlign: TextAlign.center,
                        isRepeatingAnimation: false,
                        speed: const Duration(milliseconds: 50),
                      ),
                      TyperAnimatedTextKit(
                        key: Key('en${snp.data}'),
                        text: <String>[Constants.sloganListEn[snp.data]],
                        textStyle: TextStyle(
                          fontFamily: FontType.lobster,
                          color: Colors.white,
                          fontSize: setSp(24),
                        ),
                        textAlign: TextAlign.center,
                        isRepeatingAnimation: false,
                        speed: const Duration(milliseconds: 10),
                      ),
                      SizedBox(
                        height: setHeight(15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: setWidth(5),
                            height: setWidth(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _indicatorColor(snp.data, 0),
                            ),
                          ),
                          SizedBox(width: setWidth(10)),
                          Container(
                            width: setWidth(5),
                            height: setWidth(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _indicatorColor(snp.data, 1),
                            ),
                          ),
                          SizedBox(width: setWidth(10)),
                          Container(
                            width: setWidth(5),
                            height: setWidth(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _indicatorColor(snp.data, 2),
                            ),
                          ),
                          SizedBox(width: setWidth(10)),
                          Container(
                            width: setWidth(5),
                            height: setWidth(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _indicatorColor(snp.data, 3),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
        verticalCallBack: () {
          _goMainPage<void>();
        },
        horizontalCallBack: (AxisDirection axis) {
          if (axis == AxisDirection.left) {
            if (sloganCurrentIndex == 0) {
              return;
            }
            sloganCurrentIndex--;
            bottomSloganController.add(sloganCurrentIndex);
          } else {
            if (sloganCurrentIndex == Constants.sloganListEn.length - 1) {
              _goMainPage<void>();
              return;
            }
            sloganCurrentIndex++;
            bottomSloganController.add(sloganCurrentIndex);
          }
        },
      ),
    );
  }

  Future<T> _goMainPage<T>() {
    Navigator.push<T>(
        context, MaterialPageRoute<T>(builder: (_) => SplashVideoPage()));

    return goPageAndKillSelf<T>(MainPage());
  }

  Color _indicatorColor(int currentIndex, int index) =>
      currentIndex == index ? Colors.white : Colors.white70;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
      case AppLifecycleState.inactive:
//        _videoPlayerController?.play();
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
//        _videoPlayerController?.pause();
        break;
    }

    super.didChangeAppLifecycleState(state);
  }

  Positioned bottomFooterWidget() {
    return Positioned(
      bottom: ScreenUtil.bottomBarHeight + setHeight(20),
      left: 0,
      right: 0,
      child: Glide.loadAssetIcon(
        'ic_top_arrow_double.png',
        height: setHeight(30),
      ),
    );
  }

  Positioned centerLogoWidget() {
    return Positioned(
      top: setHeight(250),
      left: 0,
      right: 0,
      child: Glide.loadAssetIcon(
        'ic_account_login_header.png',
        height: setHeight(100),
      ),
    );
  }
}
