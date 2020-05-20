import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_eyes/provider/app_provider.dart';
import 'package:flutter_eyes/provider/providers.dart';
import 'package:flutter_eyes/utils/route/router_observers.dart';
import 'package:flutter_eyes/utils/sp_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'common/application.dart';
import 'ui/splash/splash_page.dart';

void main() async {
  SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  WidgetsFlutterBinding.ensureInitialized();
  await Application.initApp();
  runApp(MultiProvider(
    providers: providers,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (_, value, child) {
        return MaterialApp(
          title: 'Flutter Demo Eyes',
          theme: value.theme,
          navigatorKey: Application.globalKey,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            ScreenUtil.init(
              context,
              allowFontScaling: false,
              width: 750,
              height: 1334,
            );
            return child;
          },
          navigatorObservers: [
            RouterObservers(),
          ],
          home: SplashPage(),
        );
      },
    );
  }
}
