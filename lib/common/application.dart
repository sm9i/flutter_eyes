import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_eyes/utils/device_util.dart';
import 'package:flutter_eyes/utils/net/net_util.dart';
import 'package:flutter_eyes/utils/sp_util.dart';

class Application {
  static final isDebug = true;

  static final GlobalKey<NavigatorState> _globalKey =
      GlobalKey<NavigatorState>();

  ///初始化config
  static initApp() async {
    await DeviceUtil.initDeviceInfo();
    await SpUtil.getInstance();
    NetUtil.initConfig();
  }

  static GlobalKey<NavigatorState> get globalKey => _globalKey;
}
