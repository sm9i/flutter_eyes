import 'dart:math';

import 'package:flutter/material.dart';

///随机颜色
Color get randomColor => Color.fromARGB(
    255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));

///时间转换为str
///如果是当天就格式化时间为 HH:mm
///如果是一周前发布的就显示几天前
///如果超过5天显示一周前
String getTimeStr(DateTime time) {
  final DateTime now = DateTime.now();
  final int differenceValue = now.difference(time).inDays.abs();
  if (differenceValue < 1) {
    return '${time.hour}:${time.minute}';
  } else if (differenceValue > 1 && differenceValue < 7) {
    return '$differenceValue 天前';
  } else {
    return '一周前';
  }
}

///将秒数转换为 00 00' 00''格式
String getElapseTimeForShow(int seconds) {
  String res = '';
  final int h = seconds ~/ (60 * 60);
  if (h != 0) {
    res += '$h ';
  }
  final int m = (seconds - 60 * 60 * h) ~/ 60;
  if (m != 0 && m > 9) {
    res += '$m\' ';
  } else {
    res += '0$m\' ';
  }
  final int s = seconds - 60 * 60 * h - 60 * m;
  if (s != 0 && s > 9) {
    res += '$s"';
  } else {
    res += '0$s\"';
  }
  return res;
}
