import 'package:flutter/material.dart';
import 'package:flutter_eyes/model/model.dart';
import 'package:flutter_eyes/utils/log_util.dart';
import 'package:flutter_eyes/utils/net/net_util.dart';
import 'package:flutter_eyes/widget/item_widget.dart';
import 'package:flutter_eyes/widget/status/provider_widget.dart';
import 'package:provider/provider.dart';

class UrlListWidget extends StatefulWidget {
  const UrlListWidget({Key key, this.apiUrl}) : super(key: key);
  final String apiUrl;

  @override
  _UrlListWidgetState createState() => _UrlListWidgetState();
}

class _UrlListWidgetState extends State<UrlListWidget>
    with AutomaticKeepAliveClientMixin {
  UrlListProvider _urlListProvider;

  @override
  void initState() {
    _urlListProvider = UrlListProvider(widget.apiUrl);
    _urlListProvider.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiStatusWidget(
      provider: _urlListProvider.widgetProvider,
      content: ChangeNotifierProvider<UrlListProvider>.value(
        value: _urlListProvider,
        child: Selector<UrlListProvider, BaseInfo>(
          selector: (_, UrlListProvider provider) => provider.baseInfo,
          builder: (_, BaseInfo value, __) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (_, int index) =>
                  convertWidget(value.itemList[index]),
              itemCount: value.itemList.length,
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class UrlListProvider extends ChangeNotifier {
  UrlListProvider(this.apiUrl);

  final WidgetProvider _widgetProvider = WidgetProvider();

  String apiUrl;

  BaseInfo _baseInfo;

  Future<void> getData() async {
    try {
      _baseInfo =
          BaseInfo.fromJson(await NetUtil.get<Map<String, dynamic>>(apiUrl));
      _widgetProvider.changeStatus(PageStatus.content);
      notifyListeners();
    } catch (e) {
      LogUtil.e(e);
      _widgetProvider.changeStatus(PageStatus.error);
    }
  }

  BaseInfo get baseInfo => _baseInfo;

  WidgetProvider get widgetProvider => _widgetProvider;
}
