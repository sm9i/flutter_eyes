import 'package:flutter/material.dart';
import 'package:flutter_eyes/common/application.dart';
import 'package:flutter_eyes/model/model.dart';
import 'package:flutter_eyes/ui/home/provider/home_provider.dart';
import 'package:flutter_eyes/ui/video/video_page.dart';
import 'package:flutter_eyes/widget/button/throttle_btn.dart';
import 'package:flutter_eyes/widget/home/home_head_widget.dart';
import 'package:flutter_eyes/widget/home/home_item_widget.dart';
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
      content: ChangeNotifierProvider<HomeProvider>.value(
        value: _homeProvider,
        child: Selector<HomeProvider, BaseInfo>(
          selector: (_, HomeProvider provider) => provider.baseInfo,
          builder: (_, BaseInfo value, __) => PullToRefreshNotification(
            onRefresh: _homeProvider.getHomeInfo,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: ClampingScrollPhysics()),
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: HomeHeadWidget(
                    topIssue: value.topIssue,
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, int index) => Throttle(
                      onTap: () {
                        globalKey.currentState.push<void>(
                          MaterialPageRoute<void>(
                            builder: (_) => VideoPage(
                              currentInfo: value.itemList[index].data.content.data,
                              videosInfo: value.itemList,
                              defaultIndex: index,
                            ),
                          ),
                        );
                      },
                      child: HomeItemWidget(
                        contentInfo: value.itemList[index].data,
                      ),
                    ),
                    childCount: value.itemList.length,
                  ),
                ),
              ],
            ),
          ),
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
