import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eyes/constants/configuration.dart';
import 'package:flutter_eyes/ui/splash/splash_common_page.dart';
import 'package:flutter_eyes/ui/splash/splash_video_page.dart';
import 'package:flutter_eyes/utils/device_util.dart';
import 'package:flutter_eyes/utils/sp_util.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!SpUtil.getBool(Config.isFirstOpenBool)) {
      return SplashVideoPage();
    } else {
      return SplashCommonPage(
        isShowUserAnim: !SpUtil.getBool(Config.isShowUserAnimBool),
      );
    }
  }

  bool isIosSimulator() =>
      (Platform.isIOS && !DeviceUtil.iosDeviceInfo.isPhysicalDevice);
}
