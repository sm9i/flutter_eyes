import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_eyes/common/common_fun.dart';
import 'package:flutter_eyes/constants/configuration.dart';
import 'package:flutter_eyes/constants/constants.dart';
import 'package:flutter_eyes/constants/font_type.dart';
import 'package:flutter_eyes/utils/image_util.dart';
import 'package:flutter_eyes/utils/net/net_util.dart';
import 'package:flutter_eyes/utils/screens.dart';
import 'package:flutter_eyes/utils/sp_util.dart';
import 'package:flutter_eyes/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_eyes/common/helper.dart';

import '../main_page.dart';
import '../../widget/intercept_vertical_widget.dart';

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
                builder: (_, snp) {
                  return Column(
                    children: <Widget>[
                      TyperAnimatedTextKit(
                        key: Key('zh${snp.data}'),
                        text: [Constants.sloganListZh[snp.data]],
                        textStyle: TextStyle(
                          fontFamily: FontType.bold,
                          color: Colors.white,
                          fontSize: setSp(23),
                        ),
                        textAlign: TextAlign.center,
                        isRepeatingAnimation: false,
                        speed: Duration(milliseconds: 50),
                      ),
                      TyperAnimatedTextKit(
                        key: Key('en${snp.data}'),
                        text: [Constants.sloganListEn[snp.data]],
                        textStyle: TextStyle(
                          fontFamily: FontType.lobster,
                          color: Colors.white,
                          fontSize: setSp(24),
                        ),
                        textAlign: TextAlign.center,
                        isRepeatingAnimation: false,
                        speed: Duration(milliseconds: 10),
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
        verticalCallBack: () => _goMainPage(),
        horizontalCallBack: (axis) {
          if (axis == AxisDirection.left) {
            if (sloganCurrentIndex == 0) {
              return;
            }
            sloganCurrentIndex--;
            bottomSloganController.add(sloganCurrentIndex);
          } else {
            if (sloganCurrentIndex == Constants.sloganListEn.length - 1) {
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
    goPageAndKillSelf(MainPage());
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
