part of 'app_responsive_ui.dart';

extension SizeExtension on num {
  // Get bottom padding plus for platform (iOS, Android): ios + 16, android + 0
  double get add16BottomPaddingIos => this + AppTheme.paddingPlatformPlus;
  // Set width
  @Deprecated("Using 'ratio' or 'r' instead")
  double get w => this * ScreenUtil()._sizeScale;

  // Set height
  @Deprecated("Using 'ratioOnHeight' instead")
  double get h => this * ScreenUtil()._sizeScale;

  // Shrink on small screen
  double shrink([double ratio = 0.75]) =>
      this * ScreenUtil()._sizeScaleSmall(ratio);

  // Set border radius to adapt with tablet
  double get r => ratio;

  // Get number with screen ratio to design
  double get ratio => this * ScreenUtil()._screenRatioToDesign;

  double get ratioOnHeight => this * ScreenUtil()._screenRatioHeightToDesign;

  double get ratioSemi => this * ScreenUtil()._screenSemiRatioToDesign;

  double get rTablet => ratioOnlyForTablet;

  double get rPhone => ratioOnlyForPhone;

  double get ratioOnlyForTablet {
    if (AppPlatform.isTablet) {
      return this * ScreenUtil()._screenRatioToDesign;
    }
    return toDouble();
  }

  /// only for phone
  double get ratioOnlyForPhone {
    if (AppPlatform.isPhone) {
      return this * ScreenUtil()._screenRatioToDesign;
    }
    return toDouble();
  }

  /// only for small screen
  double get ratioOnlyForSmallScreen {
    if (AppPlatform.isSmallScreen) {
      return this * ScreenUtil()._screenRatioToDesign;
    }
    return toDouble();
  }
}
