import 'dart:io';

import 'package:device_info/device_info.dart';

class DeviceUtil {
  static AndroidDeviceInfo _androidDeviceInfo;
  static IosDeviceInfo _iosDeviceInfo;

  ///初始化device
  static initDeviceInfo() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      _androidDeviceInfo = await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      _iosDeviceInfo = await deviceInfo.iosInfo;
    }
  }

  static IosDeviceInfo get iosDeviceInfo => _iosDeviceInfo;

  static AndroidDeviceInfo get androidDeviceInfo => _androidDeviceInfo;
}
