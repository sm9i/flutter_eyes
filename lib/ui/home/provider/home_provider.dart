import 'package:flutter/material.dart';
import 'package:flutter_eyes/model/model.dart';
import 'package:flutter_eyes/utils/log_util.dart';
import 'package:flutter_eyes/utils/net/api.dart';
import 'package:flutter_eyes/utils/net/net_util.dart';
import 'package:flutter_eyes/widget/status/provider_widget.dart';

class HomeProvider extends ChangeNotifier {
  final WidgetProvider _widgetProvider = WidgetProvider();

  WidgetProvider get widgetProvider => _widgetProvider;

  BaseInfo _baseInfo;



  Future<bool> getHomeInfo() async {
    try {
      _baseInfo = BaseInfo.fromJson(
          await NetUtil.get<Map<String, dynamic>>(Api.homeInfo));
      LogUtil.e(_baseInfo.count);
      _widgetProvider.changeStatus(PageStatus.content);
      notifyListeners();
      return true;
    } catch (e) {
      LogUtil.e(e);
      _widgetProvider.changeStatus(PageStatus.error);
      return false;
    }
  }

  BaseInfo get baseInfo => _baseInfo;
  @override
  void dispose() {
    _widgetProvider.dispose();
    super.dispose();
  }
}
