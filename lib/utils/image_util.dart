import 'package:extended_image/extended_image.dart';
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

  static Widget loadImage(
    String url, {
    double width,
    double height,
    BoxFit fit,
  }) {
    return ExtendedImage.network(
      url,
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

  static String assetsBottomIcon(String name) {
    assert(name != null && name != '');
    return _assetBottomIcons + name;
  }

  static String get _assetIcons => "assets/icons/";

  static String get _assetBottomIcons => "assets/icons/bottom/";

  static String get _assetImages => "assets/images/";
}
