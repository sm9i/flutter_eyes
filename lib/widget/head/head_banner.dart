import 'package:flutter/material.dart';

class HeadBanner extends StatefulWidget {
  const HeadBanner({Key key, this.controller, this.images}) : super(key: key);
  final PageController controller;
  final List<String> images;

  @override
  _HeadBannerState createState() => _HeadBannerState();
}

class _HeadBannerState extends State<HeadBanner> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
