import 'package:flutter/material.dart';

class ScreenConfig {
  ScreenConfig._();

  static late MediaQueryData _mediaQueryData;
  @Deprecated('Use "screenWidth" instead')
  static late double screenWidth;
  @Deprecated('Use "screenHeight" instead')
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }

  //tính toán dự trên 7<x>7
  static bool isBigScreen() {
    return blockSizeVertical > 7 ? false : true;
  }

  static double wp(percentage) {
    return percentage / 100 * screenWidth;
  }

  static double hp(percentage) {
    return percentage / 100 * screenHeight;
  }

  static double getWidthPx(int pixels) {
    return (pixels / 3.61) / 100 * screenWidth;
  }

  static double getWidthPx2(double pixels) {
    return (pixels / 3.61) / 100 * screenWidth;
  }

  static bool isPhone() {
    // true -> phone , false -> tablet
    // ignore: deprecated_member_use
    final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? true : false;
  }
}
