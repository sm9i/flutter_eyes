import 'package:flutter/cupertino.dart';

class Glide {
  Glide._();

  static Widget loadAssetIcon(
    String name, {
    double width,
    double height,
    BoxFit fit,
  }) {
    return Image.asset(
      assetsIconPath(name),
      width: width,
      height: height,
      fit: fit,
    );
  }

  static String assetsIconPath(String name) {
    assert(name != null && name != '');
    return _assetIcons + name;
  }

  static String assetsImagePath(String name) {
    assert(name != null && name != '');
    return _assetImages + name;
  }

  static String get _assetIcons => "assets/icons/";

  static String get _assetImages => "assets/images/";
}
