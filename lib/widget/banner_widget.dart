import 'dart:async';

import 'package:flutter/material.dart';

///轮播图
///[itemCount] 数量
///[itemBuilder] 单一的build
///[duration] 执行时间
class BannerWidget extends StatefulWidget {
  const BannerWidget({
    Key key,
    this.itemCount,
    this.itemBuilder,
    this.duration,
  }) : super(key: key);
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Duration duration;

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  PageController _pageController;

  int currentPage = 0;
  Timer _timer;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    startTime();
    super.initState();
  }

  void startTime() {
    _timer = Timer.periodic(
        widget.duration ?? const Duration(milliseconds: 3000), (_) {
      currentPage++;
      if (currentPage == widget.itemCount) {
        currentPage = 0;
      }
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemBuilder: widget.itemBuilder,
      itemCount: widget.itemCount,
      onPageChanged: (int index) {
        currentPage = index;
        _timer?.cancel();
        _timer = null;
        startTime();
      },
    );
  }
}
