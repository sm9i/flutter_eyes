import 'package:flutter/material.dart';
import 'package:flutter_eyes/utils/screens.dart';

///关注小按钮
Widget followWidget({Color color = Colors.white}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(3)),
      border: Border.all(color: color),
    ),
    padding: EdgeInsets.symmetric(
      horizontal: setWidth(10),
      vertical: setHeight(5),
    ),
    child: Text(
      '+关注',
      style: TextStyle(color: color, fontSize: setSp(24)),
    ),
  );
}
