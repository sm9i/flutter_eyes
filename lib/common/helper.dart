import 'package:flutter/material.dart';

extension Push on State {
  Future goPage(Widget child) {
    return Navigator.push(
        context, new MaterialPageRoute(builder: (_) => child));
  }

  Future goPageAndKillSelf(Widget child) {
    return Navigator.pushReplacement(
      context,
      new MaterialPageRoute(builder: (_) => child),
    );
  }
}
