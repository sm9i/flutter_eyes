import 'package:flutter/material.dart';

///节流btn
///[defaultTime] 时间限制在 毫秒内

class Throttle extends StatelessWidget {
  Throttle({
    Key key,
    this.defaultTime = 500,
    @required this.onTap,
    @required this.child,
  })  : assert(onTap != null && child != null),
        super(key: key);
  final int defaultTime;
  final Widget child;
  final GestureTapCallback onTap;

  DateTime lastTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: () {
        onTap();
        return;
//        if (lastTap != null) {
//          print(DateTime.now().difference(lastTap) >
//              Duration(milliseconds: defaultTime));
//        }
//        if (lastTap == null ||
//            DateTime.now().difference(lastTap) >
//                Duration(milliseconds: defaultTime)) {
//          this.lastTap = DateTime.now();
//          onTap();
//        }
      },
    );
  }
}
