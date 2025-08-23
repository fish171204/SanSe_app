part of 'app_theme.dart';

class MyColors {
  static const background = Color(0xFFFEF7FF);
  static const error = Color(0xFFB3261E);
  static const errorContainer = Color(0xFFF9DEDC);
  static const inverseOnSurface = Color(0xFFF5EFF7);
  static const inversePrimary = Color(0xFFD0BCFF);
  static const inverseSurface = Color(0xFF322F35);
  static const onBackground = Color(0xFF1D1B20);
  static const onError = Color(0xFFFFFFFF);
  static const onErrorContainer = Color(0xFF852221);
  static const onPrimary = Color(0xFFFFFFFF);
  static const onPrimaryContainer = Color(0xFF4F378A);
  static const onPrimaryFixed = Color(0xFF21005D);
  static const onPrimaryFixedDim = Color(0xFFD0BCFF);
  static const onPrimaryFixedVariant = Color(0xFF4F378B);
  static const onSecondary = Color(0xFFFFFFFF);
  static const onSecondaryContainer = Color(0xFF4A4459);
  static const onSecondaryFixed = Color(0xFF1D192B);
  static const onSecondaryFixedVariant = Color(0xFF4A4458);
  static const onSurface = Color(0xFF1D1B20);
  static const onSurfaceVariant = Color(0xFF49454F);
  static const onTertiary = Color(0xFFFFFFFF);
  static const onTertiaryContainer = Color(0xFF633B48);
  static const onTertiaryFixed = Color(0xFF31111D);
  static const onTertiaryFixedVariant = Color(0xFF633B48);
  static const outline = Color(0xFF79747E);
  static const outlineVariant = Color(0xFFCAC4D0);
  static const primary = Color(0xFF65558F);
  static const primaryContainer = Color(0xFFEADDFF);
  static const primaryFixed = Color(0xFFEADDFF);
  static const secondary = Color(0xFF625871);
  static const secondaryContainer = Color(0xFFE8DEF8);
  static const secondaryFixed = Color(0xFFE8DEF8);
  static const secondaryFixedDim = Color(0xFFCCC2DC);
  static const shadow = Color(0xFF000000);
  static const surface = Color(0xFFFEF7FF);
  static const surfaceBright = Color(0xFFFEF7FF);
  static const surfaceContainer = Color(0xFFF3EDF7);
  static const surfaceContainerHigh = Color(0xFFECE6F0);
  static const surfaceContainerHighest = Color(0xFFE6E0E9);
  static const surfaceContainerLow = Color(0xFFF7F2FA);
  static const surfaceContainerLowest = Color(0xFFFFFFFF);
  static const surfaceDim = Color(0xFFDED8E1);
  static const surfaceTint = Color(0xFF6750A4);
  static const surfaceVariant = Color(0xFFE7E0EC);
  static const tertiary = Color(0xFF7D5260);
  static const tertiaryContainer = Color(0xFFFFD8E4);
  static const tertiaryFixed = Color(0xFFFFD8E4);
  static const tertiaryFixedDim = Color(0xFFEFB8C8);
}

const ColorScheme _colorSchemeLightM3 = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff14499e),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffd9e2ff),
  onPrimaryContainer: Color(0xff001944),
  secondary: Color(0xff575e71),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffdbe2f9),
  onSecondaryContainer: Color(0xff141b2c),
  tertiary: Color(0xff725572),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xfffdd7fb),
  onTertiaryContainer: Color(0xff2a132c),
  error: Color(0xffba1a1a),
  onError: Color(0xffffffff),
  errorContainer: Color(0xffffdad6),
  onErrorContainer: Color(0xff410002),
  surface: Color(0xfffefbff),
  onSurface: Color(0xff1b1b1f),
  surfaceContainerHighest: Color(0xffe1e2ec),
  onSurfaceVariant: Color(0xff44464f),
  outline: Color(0xff757780),
  outlineVariant: Color(0xffc5c6d0),
  shadow: Color(0xff000000),
  scrim: Color(0xffEF8D32),
  inverseSurface: Color(0xff303034),
  onInverseSurface: Color(0xfff2f0f4),
  inversePrimary: Color(0xffafc6ff),
  surfaceTint: Color(0xff006d3d),
);

const ColorScheme _colorSchemeDarkM3 = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xffafc6ff),
  onPrimary: Color(0xff002d6d),
  primaryContainer: Color(0xff064297),
  onPrimaryContainer: Color(0xffd9e2ff),
  secondary: Color(0xffbfc6dc),
  onSecondary: Color(0xff293042),
  secondaryContainer: Color(0xff404659),
  onSecondaryContainer: Color(0xffdbe2f9),
  tertiary: Color(0xffdfbbde),
  onTertiary: Color(0xff412742),
  tertiaryContainer: Color(0xff593e5a),
  onTertiaryContainer: Color(0xfffdd7fb),
  error: Color(0xffffb4ab),
  onError: Color(0xff690005),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xffffb4ab),
  surface: Color(0xff1b1b1f),
  onSurface: Color(0xffe3e2e6),
  surfaceContainerHighest: Color(0xff44464f),
  onSurfaceVariant: Color(0xffc5c6d0),
  outline: Color(0xff8f9099),
  outlineVariant: Color(0xff44464f),
  shadow: Color(0xff000000),
  scrim: Color(0xffffb870),
  inverseSurface: Color(0xffe3e2e6),
  onInverseSurface: Color(0xff303034),
  inversePrimary: Color(0xff2e5bb1),
  surfaceTint: Color(0xff78dc77),
);

// final colorScheme = ColorScheme.fromSeed(
//   seedColor: const Color(0xff14499e),
//   primary: isDark ? const Color(0xffafc6ff) : const Color(0xff14499e),
//   brightness: isDark ? Brightness.dark : Brightness.light,
//   surfaceTint: isDark ? const Color(0xff78dc77) : Colors.green,
//   scrim: isDark ? const Color(0xff8b5000) : Colors.orange,
// );

// class HexColor extends Color {
//   static int _getColorFromHex(String hexColor) {
//     hexColor = hexColor.toUpperCase().replaceAll('#', '');
//     if (hexColor.length == 6) {
//       hexColor = 'FF$hexColor';
//     }
//     return int.parse(hexColor, radix: 16);
//   }

//   HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
// }

extension ColorsSchemeEx on ColorScheme {
  Color get disableColor => surfaceContainerHighest;
  Color get textDisableColor => outlineVariant;
  Color get warning => scrim;
  Color get green => surfaceTint;
}

extension ColorEx on Color {
  Color withOpacityValues(double opacity) {
    return withValues(alpha: opacity);
  }
}
