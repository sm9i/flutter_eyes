import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_eyes/utils/net/net_util.dart';
import 'package:flutter_eyes/utils/sp_util.dart';

const bool _isDebug = false;
GlobalKey<NavigatorState> _globalKey = GlobalKey<NavigatorState>();

Future<void> initApp() async {
  await SpUtil.getInstance();
  NetUtil.initConfig();
  return;
}

GlobalKey<NavigatorState> get globalKey => _globalKey;

bool get isDebug => _isDebug;
