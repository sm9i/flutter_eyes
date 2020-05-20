import 'package:flutter/material.dart';
import 'package:flutter_eyes/ui/profile/profile_page.dart';
import 'package:flutter_eyes/widget/bottom_bar/bottom_bar_widget.dart';

import 'home/home_page.dart';

class MainPage extends StatelessWidget {
  final PageController _pageController = new PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              controller: _pageController,
              physics:
                  NeverScrollableScrollPhysics(parent: ClampingScrollPhysics()),
              children: <Widget>[
                HomePage(),
                Container(
                  child: Center(child: Text('2')),
                ),
                Container(
                  child: Center(child: Text('3')),
                ),
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
