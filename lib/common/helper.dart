import 'package:flutter/material.dart';

extension Push on State {
  Future<T> goPage<T>(Widget child) {
    return Navigator.push<T>(
        context, MaterialPageRoute<T>(builder: (_) => child));
  }

  Future<T> goPageAndKillSelf<T>(Widget child) {
    return Navigator.pushReplacement(
        context, MaterialPageRoute<T>(builder: (_) => child));
  }
}
