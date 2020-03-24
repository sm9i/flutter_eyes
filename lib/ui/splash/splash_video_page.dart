import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_eyes/common/common_fun.dart';
import 'package:flutter_eyes/res/StringRes.dart';
import 'package:flutter_eyes/utils/image_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_eyes/common/helper.dart';

import '../main_page.dart';
import 'intercept_vertical_widget.dart';

///主页面视频
class SplashVideoPage extends StatefulWidget {
  @override
  _SplashVideoPageState createState() => _SplashVideoPageState();
}

class _SplashVideoPageState extends State<SplashVideoPage>
    with WidgetsBindingObserver {
  VideoPlayerController _videoPlayerController;
  StreamController<int> bottomSloganController = StreamController();

  int sloganCurrentIndex = 0;

  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.asset('assets/videos/landing.mp4');
    _videoPlayerController.initialize().then((_) {
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
    });
    super.initState();
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
              bottom: setHeight(200),
              left: 0,
              right: 0,
              child: StreamBuilder<int>(
                stream: bottomSloganController.stream,
                initialData: sloganCurrentIndex,
                builder: (_, snp) {
                  return Column(
                    children: <Widget>[
                      TyperAnimatedTextKit(
                        key: Key('zh${snp.data}'),
                        text: [StringRes.sloganListZh[snp.data]],
                        textStyle: TextStyle(
                          fontFamily: 'Bold',
                          color: Colors.white,
                          fontSize: setSp(35),
                        ),
                        textAlign: TextAlign.center,
                        isRepeatingAnimation: false,
                        speed: Duration(milliseconds: 50),
                      ),
                      TyperAnimatedTextKit(
                        key: Key('en${snp.data}'),
                        text: [StringRes.sloganListEn[snp.data]],
                        textStyle: TextStyle(
                          fontFamily: 'Lobster',
                          color: Colors.white,
                          fontSize: setSp(28),
                        ),
                        textAlign: TextAlign.center,
                        isRepeatingAnimation: false,
                        speed: Duration(milliseconds: 10),
                      ),
                      SizedBox(
                        height: setHeight(20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: setWidth(10),
                            height: setWidth(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _indicatorColor(snp.data, 0),
                            ),
                          ),
                          SizedBox(width: setWidth(10)),
                          Container(
                            width: setWidth(10),
                            height: setWidth(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _indicatorColor(snp.data, 1),
                            ),
                          ),
                          SizedBox(width: setWidth(10)),
                          Container(
                            width: setWidth(10),
                            height: setWidth(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _indicatorColor(snp.data, 2),
                            ),
                          ),
                          SizedBox(width: setWidth(10)),
                          Container(
                            width: setWidth(10),
                            height: setWidth(10),
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
        verticalCallBack: () => _goMainPage(),
        horizontalCallBack: (axis) {
          if (axis == AxisDirection.left) {
            if (sloganCurrentIndex == 0) {
              return;
            }
            sloganCurrentIndex--;
            bottomSloganController.add(sloganCurrentIndex);
          } else {
            if (sloganCurrentIndex == StringRes.sloganListEn.length - 1) {
              _goMainPage();
              return;
            }
            sloganCurrentIndex++;
            bottomSloganController.add(sloganCurrentIndex);
          }
        },
      ),
    );
  }

  _goMainPage() {
    print("go main ");
    goPageAndKillSelf(MainPage());
  }

  Color _indicatorColor(int currentIndex, int index) =>
      currentIndex == index ? Colors.white : Colors.white70;

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    bottomSloganController.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
      case AppLifecycleState.inactive:
        _videoPlayerController?.play();
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        _videoPlayerController?.pause();
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
        height: setHeight(80),
      ),
    );
  }

  Positioned centerLogoWidget() {
    return Positioned(
      top: setHeight(200),
      left: 0,
      right: 0,
      child: Glide.loadAssetIcon(
        'ic_account_login_header.png',
        height: setHeight(180),
      ),
    );
  }
}
