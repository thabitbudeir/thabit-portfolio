import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Theme + text-style access for the whole app.
///
/// Old approach: Theme.of(context).textTheme.displayLarge → generic Inter.
/// New approach: AppText.of(context).display1 → JetBrains Mono, branded.
class AppTheme {
  static ThemeData light() => _build(Brightness.light);
  static ThemeData dark() => _build(Brightness.dark);

  static ThemeData get lightTheme => light();
  static ThemeData get darkTheme => dark();

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    return ThemeData(
      brightness: brightness,
      useMaterial3: true,
      scaffoldBackgroundColor:
          isDark ? AppColors.darkBackground : AppColors.lightBackground,
      canvasColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: AppColors.accent,
        onPrimary: const Color(0xFF0B0C0A),
        secondary: AppColors.accentDeep,
        onSecondary: const Color(0xFF0B0C0A),
        error: AppColors.danger,
        onError: Colors.white,
        surface: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        onSurface: isDark ? AppColors.darkInk : AppColors.lightInk,
      ),
      focusColor: AppColors.accent.withValues(alpha: 0.35),
    );
  }
}
