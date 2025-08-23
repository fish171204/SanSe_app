part of 'app_theme.dart';

InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme) {
  TextTheme textTheme = const TextTheme();
  return InputDecorationTheme(
      contentPadding: EdgeInsets.all(16.h),
      errorMaxLines: 3,
      hintStyle:
          textTheme.bodyLarge?.copyWith(color: colorScheme.onSurfaceVariant),
      labelStyle:
          textTheme.bodyLarge?.copyWith(color: colorScheme.onSurfaceVariant),
      errorStyle: textTheme.bodyLarge?.copyWith(color: colorScheme.error),
      border: _getTextFieldBorder(colorScheme.outline),
      enabledBorder: _getTextFieldBorder(colorScheme.outline),
      disabledBorder:
          _getTextFieldBorder(colorScheme.onSurface.withOpacity(0.38)),
      errorBorder: _getTextFieldBorder(colorScheme.error),
      focusedBorder: _getTextFieldBorder(colorScheme.primary, focused: true),
      focusedErrorBorder:
          _getTextFieldBorder(colorScheme.error, focused: true));
}

InputBorder? _getTextFieldBorder(Color borderColor, {bool focused = false}) =>
    OutlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: focused ? 1 : .5),
        borderRadius: BorderRadius.circular(4));
