import 'package:flutter/material.dart';
import 'package:flutter_eyes/utils/theme_util.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    //初始化
    _currentTheme = ThemeUtil.lightTheme;
  }

  //是否是暗色
  bool _isDark = false;

  ThemeData _currentTheme;

  void changeTheme(bool isDark) {
    if (this.isDark == isDark) {
      return;
    }
    _isDark = isDark;
    _currentTheme = isDark ? ThemeUtil.dartTheme : ThemeUtil.lightTheme;
    notifyListeners();
  }

  bool get isDark => _isDark;

  ThemeData get theme => _currentTheme;
}
