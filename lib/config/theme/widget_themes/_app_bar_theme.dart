part of "../app_theme.dart";

final class _AppBarTheme {
  static final AppBarTheme appBarTheme = AppBarTheme(
    actionsIconTheme: IconThemeData(
      color: AppColors.secondaryColor[50],
    ),
    scrolledUnderElevation: 0,
    color: AppColors.backgroundColor[50],
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.backgroundColor.withValues(alpha: 0.1),
      systemNavigationBarColor: AppColors.backgroundColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}
