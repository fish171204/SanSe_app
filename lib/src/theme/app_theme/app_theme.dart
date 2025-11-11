import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/src/theme/app_responsive_ui.dart';
part 'app_colors.dart';
part 'app_text_theme.dart';
part 'input_decoration_theme.dart';

abstract final class AppTheme {
  static bool get isIos => Platform.isIOS;
  static bool get isAndroid => Platform.isAndroid;
  static bool get isWindows => Platform.isWindows;
  static bool get isTablet => AppPlatform.isTablet;
  static final ThemeData light = _getTheme(_colorSchemeLightM3);

  static final ThemeData dark = _getTheme(_colorSchemeDarkM3);

  static ThemeData _getTheme(ColorScheme colorScheme) {
    final textTheme = _textTheme(colorScheme.onSurface);
    return ThemeData(
        scaffoldBackgroundColor: const Color(0xffEBEBEB),
        fontFamily: "Averta",
        useMaterial3: true,
        colorScheme: colorScheme,
        actionIconTheme: ActionIconThemeData(
          backButtonIconBuilder: (context) =>
              const Icon(Icons.arrow_back_ios_rounded),
        ),
        appBarTheme: AppBarTheme(
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: Border(
                bottom:
                    BorderSide(color: colorScheme.outlineVariant, width: 0)),
            surfaceTintColor: colorScheme.surface,
            centerTitle: true,
            titleTextStyle: textTheme.titleLarge?.toRatioForPhone),
        navigationBarTheme: NavigationBarThemeData(
          surfaceTintColor: colorScheme.surface,
          shadowColor: colorScheme.shadow,
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return textTheme.bodyMedium
                  ?.copyWith(color: colorScheme.primary)
                  .toRatioForPhone;
            }
            return textTheme.bodyMedium?.toRatioForPhone;
          }),
        ),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          showCloseIcon: true,
        ),
        inputDecorationTheme: _inputDecorationTheme(colorScheme),
        textTheme: textTheme,
        tabBarTheme: TabBarThemeData(
          labelColor: colorScheme.primary,
          labelPadding: EdgeInsets.symmetric(horizontal: 32.w),
          labelStyle: textTheme.titleSmall,
          unselectedLabelStyle: textTheme.titleSmall,
        ),
        listTileTheme: ListTileThemeData(titleTextStyle: textTheme.bodyLarge),
        popupMenuTheme: PopupMenuThemeData(
            color: colorScheme.onInverseSurface,
            surfaceTintColor: colorScheme.onInverseSurface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4.ratio),
              ),
            )),
        dialogTheme: DialogThemeData(
          titleTextStyle: textTheme.headlineSmall?.toRatioForPhone,
          contentTextStyle: textTheme.bodyMedium,
          alignment: Alignment.center,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                elevation: 2,
                shadowColor: colorScheme.onSurface.withOpacity(.3))),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(shape: CircleBorder()),
        dividerTheme: const DividerThemeData(thickness: .5, space: 0),
        dropdownMenuTheme: DropdownMenuThemeData(
            textStyle: textTheme.bodyLarge,
            inputDecorationTheme: _inputDecorationTheme(colorScheme)),
        sliderTheme: SliderThemeData(
          activeTickMarkColor: Colors.transparent,
          inactiveTickMarkColor: Colors.transparent,
          inactiveTrackColor: colorScheme.primaryContainer,
        ));
  }

  static final canTapShadow = [
    BoxShadow(
        blurRadius: 6,
        offset: const Offset(0, 2),
        color: const Color(0xff000000).withOpacity(.2))
  ];
  static final cardShadow = [
    BoxShadow(
        blurRadius: 6,
        offset: const Offset(0, 2),
        color: const Color(0xff000000).withOpacity(.1))
  ];
  static final cardShadowDisable = [
    BoxShadow(
        blurRadius: 6,
        offset: const Offset(0, 2),
        color: const Color.fromARGB(255, 70, 68, 68).withOpacity(.1))
  ];

  static final shadowRound = [
    BoxShadow(
      color: const Color(0xff000000).withOpacity(.3),
      blurRadius: 10,
      spreadRadius: 2,
      offset: const Offset(0, 0),
    )
  ];

  /// Adding padding for platform: iOS has padding 16 , Android has padding 0
  static double get paddingPlatformPlus => isIos ? 16 : 0;

  static Border borderNone = Border.all(color: Colors.transparent);
}

abstract final class AppPadding {
  static final EdgeInsets screenPadding = EdgeInsets.only(
      left: 16, right: 16, top: 16, bottom: 16 + AppTheme.paddingPlatformPlus);

  static final double bottomPaddingScreen = 16 + AppTheme.paddingPlatformPlus;
}
