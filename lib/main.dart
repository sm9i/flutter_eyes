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

Future<void> main() async {
  final SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light);

  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  runApp(MultiProvider(
    providers: providers,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (_, AppProvider value, Widget child) {
        return MaterialApp(
          title: 'Flutter Demo Eyes',
          theme: value.theme,
          navigatorKey: globalKey,
          debugShowCheckedModeBanner: false,
          builder: (BuildContext context, Widget child) {
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
