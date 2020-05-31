import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_eyes/model/model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_eyes/utils/image_util.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';

class HomeHeadWidget extends StatefulWidget {
  const HomeHeadWidget({Key key, @required this.topIssue}) : super(key: key);
  final TopIssue topIssue;

  @override
  _HomeHeadWidgetState createState() => _HomeHeadWidgetState();
}

class _HomeHeadWidgetState extends State<HomeHeadWidget> {
  @override
  Widget build(BuildContext context) {
    return PullToRefreshContainer(_builder);
  }

  Widget _builder(PullToRefreshScrollNotificationInfo info) {
    final double height = min(info?.dragOffset ?? 0.0, 100.0) +
        MediaQuery.of(context).size.height * 0.4;
    final double width = MediaQuery.of(context).size.width;
    final double asp = width / (height - MediaQuery.of(context).padding.top);
    return Container(
      height: height,
      width: double.infinity,
      child: CarouselSlider(
        items: widget.topIssue.data.itemList
            .map((Content m) => Glide.loadImage(m.data.cover.feed))
            .toList(),
        options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 1.0,
          aspectRatio: width / height,
        ),
      ),
      color: Colors.white,
    );
  }
}
