part of 'app_theme.dart';

TextTheme _textTheme(Color textColor) => TextTheme(
    displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        height: 1.12,
        color: textColor),
    displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        height: 1.16,
        color: textColor),
    displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        height: 1.22,
        color: textColor),
    headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        height: 1.25,
        color: textColor),
    headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        height: 1.29,
        color: textColor),
    headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 1.33,
        color: textColor),
    titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        height: 1.27,
        color: textColor),
    titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: textColor),
    titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.5,
        color: textColor),
    labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.43,
        color: textColor),
    labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.33,
        color: textColor),
    labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        height: 1.45,
        color: textColor),
    bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: textColor),
    bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.43,
        color: textColor),
    bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.33,
        color: textColor));

extension TextThemeEx on TextTheme {
  /// Headline large 2
  TextStyle? get headlineLargeSemiBold =>
      headlineLarge?.copyWith(fontWeight: FontWeight.w600);

  TextStyle? get headlineMediumSemiBold =>
      headlineMedium?.copyWith(fontWeight: FontWeight.w600);

  /// headline small semibold
  TextStyle? get headlineSmallSemiBold =>
      headlineSmall?.copyWith(fontWeight: FontWeight.w600);

  TextStyle? get titleLargeSemiBold =>
      titleLarge?.copyWith(fontWeight: FontWeight.w600);

  TextStyle? get titleSmallSemiBold =>
      titleSmall?.copyWith(fontWeight: FontWeight.w600);

  TextStyle? get titleMediumSemiBold =>
      titleMedium?.copyWith(fontWeight: FontWeight.w600);

  TextStyle? get bodyLargeSemiBold =>
      bodyLarge?.copyWith(fontWeight: FontWeight.w600);

  TextStyle? get titleMedium20 =>
      titleMedium?.copyWith(fontSize: 20, height: 1.3);

  /// Body small 2
  TextStyle? get bodySemiSmall =>
      bodySmall?.copyWith(fontSize: 10, height: 1.4);

  /// Body small semibold
  TextStyle? get bodySmallSemiBold =>
      bodySmall?.copyWith(fontSize: 10, fontWeight: FontWeight.w600);
}

extension TextStyleEx on TextStyle {
  TextStyle get toRatio => copyWith(fontSize: fontSize?.ratio);

  TextStyle get toRatioForTablet =>
      copyWith(fontSize: fontSize?.ratioOnlyForTablet);

  /// for phone
  TextStyle get toRatioForPhone =>
      copyWith(fontSize: fontSize?.ratioOnlyForPhone);

  TextStyle get adapt => copyWith(fontSize: fontSize?.w);
}

extension TextStyleNullEx on TextStyle? {
  TextStyle? get toRatio {
    TextStyle? textStyle = this;
    if (textStyle == null) return null;
    return textStyle.copyWith(fontSize: textStyle.fontSize?.ratio);
  }

  TextStyle? get toRatioOnlyForTablet {
    TextStyle? textStyle = this;
    if (textStyle == null) return null;
    return textStyle.copyWith(fontSize: textStyle.fontSize?.ratioOnlyForTablet);
  }

  TextStyle? get toRatioOnlyForPhone {
    TextStyle? textStyle = this;
    if (textStyle == null) return null;
    return textStyle.copyWith(fontSize: textStyle.fontSize?.ratioOnlyForPhone);
  }
}

void logTextTheme(TextTheme textTheme) {
  // final theme = textTheme;
  // final listTheme = [
  //   MapEntry("displayLarge", theme.displayLarge),
  //   MapEntry("displayMedium", theme.displayMedium),
  //   MapEntry("displaySmall", theme.displaySmall),
  //   MapEntry("headlineLarge", theme.headlineLarge),
  //   MapEntry("headlineMedium", theme.headlineMedium),
  //   MapEntry("headlineSmall", theme.headlineSmall),
  //   MapEntry("titleLarge", theme.titleLarge),
  //   MapEntry("titleMedium", theme.titleMedium),
  //   MapEntry("titleSmall", theme.titleSmall),
  //   MapEntry("labelLarge", theme.labelLarge),
  //   MapEntry("labelMedium", theme.labelMedium),
  //   MapEntry("labelSmall", theme.labelSmall),
  //   MapEntry("bodyLarge", theme.bodyLarge),
  //   MapEntry("bodyMedium", theme.bodyMedium),
  //   MapEntry("bodySmall", theme.bodySmall),
  // ];

  // for (var entry in listTheme) {
  //   final textTheme = entry.value;
  //   logger.d([
  //     entry.key,
  //     "Font size:  ${textTheme?.fontSize}",
  //     "fontFamily:  ${textTheme?.fontFamily}",
  //     "fontStyle:  ${textTheme?.fontStyle}",
  //     "fontWeight:  ${textTheme?.fontWeight}",
  //     "height:  ${textTheme?.height}",
  //     "color:  ${textTheme?.color}",
  //   ]);
  // }
}
