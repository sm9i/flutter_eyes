import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_eyes/model/model.dart';
import 'package:flutter_eyes/utils/image_util.dart';
import 'package:flutter_eyes/widget/banner_widget.dart';
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
        MediaQuery.of(context).size.height * 0.3;
    final double width = MediaQuery.of(context).size.width;
    final double asp = width / (height - MediaQuery.of(context).padding.top);
    return Container(
      height: height,
      width: double.infinity,
      child: BannerWidget(
        itemCount: widget.topIssue.data.itemList.length,
        itemBuilder: (_, int index) {
          return Glide.loadImage(
            widget.topIssue.data.itemList[index].data.cover.feed,
            fit: BoxFit.cover,
          );
        },
      ),
      color: Colors.white,
    );
  }
}
