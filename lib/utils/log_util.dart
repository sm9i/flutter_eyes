import 'package:flutter/material.dart';
import 'package:flutter_eyes/common/application.dart';

///Log 封装
class LogUtil {
  LogUtil.i(dynamic dyn) {
    debugPrint('Eye = [Info] : ' + dyn.toString());
  }

  LogUtil.d(dynamic dyn) {
    if (isDebug) {
      debugPrint('Eye = [DEBUG] : ' + dyn.toString());
    }
  }

  LogUtil.e(dynamic dyn) {
    debugPrint('Eye = [ERROR] : ' + dyn.toString());
  }
}

enum LogLevel {
  Info,
  Error,
  Debug,
}
