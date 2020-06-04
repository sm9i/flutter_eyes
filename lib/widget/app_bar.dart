import 'package:flutter/material.dart';
import 'package:flutter_eyes/utils/screens.dart';

class CommonAppBarWidget extends StatelessWidget {
  const CommonAppBarWidget(
      {Key key,
      @required this.left,
      @required this.center,
      @required this.right})
      : super(key: key);
  final Widget left;
  final Widget center;
  final Widget right;

  @override
  Widget build(BuildContext context) {
    final double paddingTop = MediaQuery.of(context).padding.top;
    return Container(
      height: setHeight(80) + paddingTop,
      padding: EdgeInsets.only(
        top: paddingTop,
        left: setWidth(30),
        right: setWidth(30),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: setWidth(10)),
            child: Center(child: left ?? Container()),
          ),
          Expanded(
            child: Center(
              child: center,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: setWidth(10)),
            child: Center(child: right ?? Container()),
          ),
        ],
      ),
    );
  }
}
