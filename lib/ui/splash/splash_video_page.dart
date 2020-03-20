import 'package:flutter/material.dart';
import 'package:flutter_eyes/common/common_fun.dart';
import 'package:flutter_eyes/utils/image_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

///主页面视频
class SplashVideoPage extends StatefulWidget {
  @override
  _SplashVideoPageState createState() => _SplashVideoPageState();
}

class _SplashVideoPageState extends State<SplashVideoPage>
    with WidgetsBindingObserver {
  VideoPlayerController _videoPlayerController;

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
      child: Stack(
        children: <Widget>[
          VideoPlayer(_videoPlayerController),
          Positioned(
            top: setHeight(200),
            left: 0,
            right: 0,
            child: Glide.loadAssetIcon(
              'ic_account_login_header.png',
              height: setHeight(180),
            ),
          ),
          Positioned(
            bottom: ScreenUtil.bottomBarHeight + setHeight(20),
            left: 0,
            right: 0,
            child: Glide.loadAssetIcon(
              'ic_top_arrow_double.png',
              height: setHeight(80),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
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
}
