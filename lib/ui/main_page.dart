import 'package:flutter/material.dart';
import 'package:flutter_eyes/ui/feed/feed_page.dart';
import 'package:flutter_eyes/ui/profile/profile_page.dart';
import 'package:flutter_eyes/widget/bottom_bar/bottom_bar_widget.dart';

import 'follow/follow_page.dart';
import 'home/home_page.dart';

class MainPage extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(
                  parent: ClampingScrollPhysics()),
              children: <Widget>[
                HomePage(),
                FeedPage(),
                FollowPage(),
                ProfilePage(),
              ],
            ),
          ),
          BottomBarWidget(
            pageController: _pageController,
          )
        ],
      ),
    );
  }
}
