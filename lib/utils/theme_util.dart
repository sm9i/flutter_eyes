import 'package:flutter/material.dart';

import 'no_splash.dart';

// ignore: avoid_classes_with_only_static_members
class ThemeUtil {
  static ThemeData get dartTheme => ThemeData.dark().copyWith(
        bottomAppBarColor: Colors.black54,
        splashFactory: const NoSplashFactory(),
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
//        textTheme: TextTheme(
//          headline1: TextStyle(color: Colors.white),
//          headline2: TextStyle(color: Colors.white70),
//          headline3: TextStyle(color: Colors.white60),
//          headline4: TextStyle(color: Colors.white54),
//          headline5: TextStyle(color: Colors.white38),
//          headline6: TextStyle(color: Colors.white24),
//          subtitle1: TextStyle(color: Colors.white),
//          subtitle2: TextStyle(color: Colors.white),
//          bodyText1: TextStyle(color: Colors.white),
//          bodyText2: TextStyle(color: Colors.white),
//        ),
      );

  static ThemeData get lightTheme => ThemeData.light().copyWith(
        bottomAppBarColor: Colors.white70,
        brightness: Brightness.light,
        primaryColor: Colors.white,
        splashFactory: const NoSplashFactory(),
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
//        textTheme: TextTheme(
//          headline1: TextStyle(color: Colors.black),
//          headline2: TextStyle(color: Colors.black),
//          headline3: TextStyle(color: Colors.black),
//          headline4: TextStyle(color: Colors.black),
//          headline5: TextStyle(color: Colors.black),
//          headline6: TextStyle(color: Colors.black),
//          subtitle1: TextStyle(color: Colors.black),
//          subtitle2: TextStyle(color: Colors.black),
//          bodyText1: TextStyle(color: Colors.black),
//          bodyText2: TextStyle(color: Colors.black),
//        ),
      );

  static Color get dividerColor => const Color(0x66A2A2A2);
}
