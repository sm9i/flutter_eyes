import 'package:flutter/material.dart';
import 'package:flutter_eyes/utils/image_util.dart';
import 'package:flutter_eyes/utils/screens.dart';
import 'package:flutter_eyes/widget/button/throttle_btn.dart';

final bottomItem = [
  BottomBarItem(0, 'ic_tab_strip_icon_category.png',
      'ic_tab_strip_icon_category_selected.png', '首页'),
  BottomBarItem(1, 'ic_tab_strip_icon_feed.png',
      'ic_tab_strip_icon_feed_selected.png', '发现'),
  BottomBarItem(2, 'ic_tab_strip_icon_follow.png',
      'ic_tab_strip_icon_follow_selected.png', '关注'),
  BottomBarItem(3, 'ic_tab_strip_icon_profile.png',
      'ic_tab_strip_icon_profile_selected.png', '我的'),
];

class BottomBarWidget extends StatelessWidget {
  final PageController pageController;

  const BottomBarWidget({Key key, this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppBarTheme.of(context).color,
        height: setHeight(90) + MediaQuery.of(context).padding.bottom,
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Row(
          children: bottomItem
              .map((m) => Expanded(
                  child: _BottomBarItemWidget(
                      item: m, pageController: pageController)))
              .toList(),
        ),
      ),
    );
  }
}

class _BottomBarItemWidget extends StatelessWidget {
  final BottomBarItem item;
  final PageController pageController;

  const _BottomBarItemWidget({
    Key key,
    this.item,
    this.pageController,
  }) : super(key: key);

  int getCurrentIndex() {
    if (pageController.page == null) {
      return 0;
    } else {
      return pageController.page.round();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (_, child) {
        return Throttle(
          onTap: () => pageController.jumpToPage(item.index),
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: setHeight(5)),
                Expanded(
                  child: Image.asset(
                    Glide.assetsBottomIcon(
                      getCurrentIndex() == item.index
                          ? item.selectedIcon
                          : item.unSelectedIcon,
                    ),
                  ),
                ),
                SizedBox(height: setHeight(5)),
                Text(
                  item.title,
                  style: AppBarTheme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: setSp(23)),
                ),
                SizedBox(height: setHeight(10)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BottomBarItem {
  final String unSelectedIcon;
  final String selectedIcon;
  final String title;
  final int index;

  BottomBarItem(
    this.index,
    this.unSelectedIcon,
    this.selectedIcon,
    this.title,
  );
}
