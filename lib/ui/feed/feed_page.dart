import 'package:flutter/material.dart';
import 'package:flutter_eyes/constants/constants.dart';
import 'package:flutter_eyes/constants/font_type.dart';
import 'package:flutter_eyes/widget/app_bar.dart';
import 'package:flutter_eyes/widget/url_list_widget.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          CommonAppBarWidget(
            left: appbarLeft,
            center: appbarCenter,
            right: rightRight,
          ),
          TabBar(
            controller: _tabController,
            tabs: Constants.tabs
                .map(
                  (TabBarInfo m) => Tab(text: m.title),
                )
                .toList(),
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: Constants.tabs
                  .map((TabBarInfo m) => UrlListWidget(apiUrl: m.apiUrl))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  final Widget appbarLeft = const Text('全部分类');

  final Widget appbarCenter =
      Text('Discover', style: TextStyle(fontFamily: FontType.lobster));

  final Widget rightRight = Icon(Icons.search, color: Colors.black87);
}

class TabBarInfo {
  TabBarInfo(this.title, this.apiUrl);

  final String title;

  final String apiUrl;
}
