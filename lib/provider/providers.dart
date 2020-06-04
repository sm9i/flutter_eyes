import 'package:flutter/material.dart';
import 'package:flutter_eyes/provider/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

ChangeNotifierProvider<T> buildProvider<T extends ChangeNotifier>(T value) {
  return ChangeNotifierProvider<T>.value(value: value);
}

List<SingleChildWidget> get providers => _providers;

final List<ChangeNotifierProvider<AppProvider>> _providers = [
  buildProvider<AppProvider>(AppProvider()),
];
