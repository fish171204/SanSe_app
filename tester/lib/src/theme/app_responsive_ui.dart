import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:tester/src/theme/app_theme/app_theme.dart';
part 'size_extension.dart';

class ScreenUtil {
  bool? _isSmallScreen;
  bool _isTablet = false;
  double _screenWidth = 0;
  double _screenHeight = 0;
  double _screenRatioToDesign = 1;
  double _screenRatioHeightToDesign = 1;
  double _screenSemiRatioToDesign = 1;
  double _sizeScale = 1;

  static final ScreenUtil _instance = ScreenUtil._();

  ScreenUtil._();

  factory ScreenUtil() {
    return _instance;
  }

  void init(BuildContext context) {
    // if (_screenWidth != 0) return;
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    _isSmallScreen = _detectSmallScreen();
    _isTablet = _detectTablet();

    /// Dependent
    _sizeScale = _isSmallScreen! ? 0.85 : 1.0;
    _screenRatioToDesign = _screenWidth / 428;
    _screenRatioHeightToDesign = _screenHeight / 926;
    var subRatio = _screenRatioToDesign - 1;
    _screenSemiRatioToDesign = subRatio / 2 + 1;
    // logger.f([
    //   "Is small screen: $_isSmallScreen ",
    //   "Is tablet: $_isTablet ",
    // ]);
  }

  bool _detectSmallScreen() {
    return _screenWidth < 380;
  }

  bool _detectTablet() {
    return _screenWidth > 600;
  }

  double _sizeScaleSmall(double ratio) => _isSmallScreen! ? ratio : 1.0;

  static Future<void> ensureScreenSize([
    ui.FlutterView? window,
    Duration duration = const Duration(milliseconds: 10),
  ]) async {
    final binding = WidgetsFlutterBinding.ensureInitialized();
    binding.deferFirstFrame();

    await Future.doWhile(() {
      window ??= binding.platformDispatcher.implicitView;

      if (window == null || window!.physicalSize.isEmpty) {
        return Future.delayed(duration, () => true);
      }

      return false;
    });

    binding.allowFirstFrame();
  }
}

double get ratio => ScreenUtil()._screenRatioToDesign;

double get screenWidth => ScreenUtil()._screenWidth;

double get screenHeight => ScreenUtil()._screenHeight;

abstract final class AppPlatform {
  static bool get isTablet => ScreenUtil()._isTablet;

  static bool get isSmallScreen => ScreenUtil()._isSmallScreen!;

  static bool get isPhone => !ScreenUtil()._isTablet;
}
