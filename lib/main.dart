import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_eyes/utils/sp_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ui/splash/splash_page.dart';

void main() async {
  SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Eyes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        ScreenUtil.init(context, allowFontScaling: false);
        return child;
      },
      home: SplashPage(),
    );
  }
}
