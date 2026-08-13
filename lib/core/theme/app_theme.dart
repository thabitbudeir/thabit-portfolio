import 'package:flutter/material.dart';
import 'app_colors.dart';


class AppTheme {
  static ThemeData light() => _build(Brightness.light);
  static ThemeData dark() => _build(Brightness.dark);

  static ThemeData get lightTheme => light();
  static ThemeData get darkTheme => dark();

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final accent = isDark ? AppColors.darkAccent : AppColors.lightAccent;
    final accentDeep = isDark
        ? AppColors.darkAccentHover
        : AppColors.lightAccentHover;
    final onAccent = isDark ? AppColors.darkOnAccent : AppColors.lightOnAccent;
    return ThemeData(
      brightness: brightness,
      useMaterial3: true,
      scaffoldBackgroundColor: isDark
          ? AppColors.darkBackground
          : AppColors.lightBackground,
      canvasColor: isDark
          ? AppColors.darkBackground
          : AppColors.lightBackground,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: accent,
        onPrimary: onAccent,
        secondary: accentDeep,
        onSecondary: onAccent,
        error: AppColors.danger,
        onError: Colors.white,
        surface: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        onSurface: isDark ? AppColors.darkInk : AppColors.lightInk,
      ),
      focusColor: accent.withValues(alpha: 0.35),
      dividerColor: isDark ? AppColors.darkLine : AppColors.lightLine,
    );
  }
}
