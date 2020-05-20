import 'package:flutter/material.dart';
import 'package:flutter_eyes/utils/log_util.dart';

class RouterObservers extends NavigatorObserver {
  @override
  void didPush(Route route, Route previousRoute) {
    LogUtil.d("didPush");
    LogUtil.d("${route.settings}");

    super.didPush(route, previousRoute);
  }


  @override
  void didRemove(Route route, Route previousRoute) {
    LogUtil.d("didRemove");
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    LogUtil.d("didReplace");
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    LogUtil.d("didPop");
    super.didPop(route, previousRoute);
  }
}
