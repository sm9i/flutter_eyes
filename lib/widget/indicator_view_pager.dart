import 'dart:async';

import 'package:flutter/material.dart' hide PageController;
import 'package:flutter_eyes/model/model.dart';
import 'package:flutter_eyes/utils/image_util.dart';
import 'package:flutter_eyes/utils/screens.dart';
import 'package:flutter_eyes/utils/utils.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

///带下标的无限轮播
///用swiper实现
///pageview 没找到好办法。。
class IndicatorViewPager extends StatefulWidget {
  const IndicatorViewPager({Key key, this.contents}) : super(key: key);
  final List<Content> contents;

  @override
  _IndicatorViewPagerState createState() => _IndicatorViewPagerState();
}

class _IndicatorViewPagerState extends State<IndicatorViewPager> {
  final StreamController<int> _streamController = StreamController<int>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Swiper(
              itemCount: widget.contents.length,
              viewportFraction: 0.9,
              onIndexChanged: (int index) {
                _streamController.add(index);
              },
              itemBuilder: (_, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: setWidth(10),
                  ),
                  child: Glide.loadImage(
                    widget.contents[index].data.cover.feed,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: setHeight(20)),
            child: IndicatorWidget(
              stream: _streamController.stream,
              maxLength: widget.contents.length,
            ),
          ),
        ],
      ),
    );
  }
}
///下标
class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget(
      {Key key, @required this.stream, @required this.maxLength})
      : super(key: key);
  final Stream<int> stream;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: stream,
      initialData: 0,
      builder: (_, AsyncSnapshot<int> asyncSnapshot) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(
            maxLength,
            (int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: setWidth(5)),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == asyncSnapshot.data
                        ? Colors.black
                        : Colors.black26,
                  ),
                  width: 5,
                  height: 5,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
