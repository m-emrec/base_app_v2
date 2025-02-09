part of "../app_theme.dart";

final class _TextButtonTheme {
  _TextButtonTheme._();
  static final TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: TextStyles().textTheme.labelMedium,
      foregroundColor: AppColors.secondaryTextColor,
    ),
  );
}
