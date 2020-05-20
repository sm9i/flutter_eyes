import 'package:flutter/material.dart';
import 'package:flutter_eyes/common/application.dart';

///Log 封装
class LogUtil {
  LogUtil.i(dynamic) {
    debugPrint("Eye = [Info] : " + dynamic.toString());
  }

  LogUtil.d(dynamic) {
    if (Application.isDebug) {
      debugPrint("Eye = [DEBUG] : " + dynamic.toString());
    }
  }

  LogUtil.e(dynamic) {
    debugPrint("Eye = [ERROR] : " + dynamic.toString());
  }
}

enum LogLevel {
  Info,
  Error,
  Debug,
}
