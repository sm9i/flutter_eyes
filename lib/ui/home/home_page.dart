import 'package:flutter/material.dart';
import 'package:flutter_eyes/model/model.dart';
import 'package:flutter_eyes/ui/home/provider/home_provider.dart';
import 'package:flutter_eyes/widget/head/home_head_widget.dart';
import 'package:flutter_eyes/widget/status/provider_widget.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final HomeProvider _homeProvider = HomeProvider();

  @override
  void initState() {
    _homeProvider.getHomeInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiStatusWidget(
      provider: _homeProvider.widgetProvider,
      errorTap: () {
        _homeProvider.getHomeInfo();
      },
      content: ChangeNotifierProvider.value(
        value: _homeProvider,
        child: Selector<HomeProvider, BaseInfo>(
          builder: (_, value, __) => PullToRefreshNotification(
            onRefresh: () => _homeProvider.getHomeInfo(),
//            onRefresh: () => Future.value(true),
            pullBackOnRefresh: true,
            child: _HomeWidget(info: value),
          ),
          selector: (_, s) => s.baseInfo,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _homeProvider.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}

class _HomeWidget extends StatelessWidget {
  final BaseInfo info;

  const _HomeWidget({Key key, this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics()),
      slivers: <Widget>[
        SliverToBoxAdapter(child: HomeHeadWidget(info: info.topIssue))
      ],
    );
  }
}
