import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Typography for the Technical Mono identity.
/// 
/// Moving away from common Google Fonts to a high-quality System Stack 
/// that feels professional, technical, and "non-template".
class AppType {
  /// Technical/Code font stack.
  /// Prioritizes high-end mono fonts if installed, falls back to system mono.
  static const List<String> monoStack = [
    'ui-monospace',
    'SFMono-Regular',
    'SF Mono',
    'Menlo',
    'Monaco',
    'Consolas',
    'Liberation Mono',
    'Courier New',
    'monospace',
  ];

  /// Clean, modern Sans stack.
  /// Prioritizes the OS's native high-end font (San Francisco, Segoe UI, Roboto).
  static const List<String> sansStack = [
    '-apple-system',
    'BlinkMacSystemFont',
    'Segoe UI',
    'Helvetica',
    'Arial',
    'sans-serif',
    'Apple Color Emoji',
    'Segoe UI Emoji',
  ];

  static TextStyle mono({
    required double size,
    FontWeight weight = FontWeight.w500,
    double? height,
    double? letterSpacing,
    Color? color,
  }) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
      fontFamilyFallback: monoStack,
    );
  }

  static TextStyle sans({
    required double size,
    FontWeight weight = FontWeight.w400,
    double? height,
    double? letterSpacing,
    Color? color,
  }) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
      fontFamilyFallback: sansStack,
    );
  }
}

/// Resolves [AppTextStyles] for the current brightness.
class AppText extends InheritedWidget {
  final AppTextStyles styles;

  const AppText({
    super.key,
    required this.styles,
    required super.child,
  });

  static AppTextStyles of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<AppText>();
    assert(widget != null, 'AppText not found in widget tree');
    return widget!.styles;
  }

  @override
  bool updateShouldNotify(AppText oldWidget) =>
      oldWidget.styles.isDark != styles.isDark;
}

class AppTextScope extends StatelessWidget {
  final bool isDark;
  final Widget child;

  const AppTextScope({super.key, required this.isDark, required this.child});

  @override
  Widget build(BuildContext context) {
    return AppText(
      styles: AppTextStyles(isDark),
      child: child,
    );
  }
}

class AppTextStyles {
  AppTextStyles._(this.isDark);

  factory AppTextStyles(bool isDark) => AppTextStyles._(isDark);

  final bool isDark;
  Color get _ink => isDark ? AppColors.darkInk : AppColors.lightInk;
  Color get _inkSoft => isDark ? AppColors.darkInkSoft : AppColors.lightInkSoft;
  Color get _inkMute => isDark ? AppColors.darkInkMute : AppColors.lightInkMute;
  Color get _accent => AppColors.accent;

  TextStyle get display1 => AppType.mono(
        size: 88,
        weight: FontWeight.w600,
        height: 0.96,
        letterSpacing: -2.5,
        color: _ink,
      );

  TextStyle get display2 => AppType.mono(
        size: 64,
        weight: FontWeight.w600,
        height: 1.0,
        letterSpacing: -1.6,
        color: _ink,
      );

  TextStyle get display3 => AppType.mono(
        size: 44,
        weight: FontWeight.w600,
        height: 1.05,
        letterSpacing: -1.0,
        color: _ink,
      );

  TextStyle get heading1 => AppType.mono(
        size: 32,
        weight: FontWeight.w600,
        height: 1.1,
        letterSpacing: -0.4,
        color: _ink,
      );

  TextStyle get heading2 => AppType.mono(
        size: 22,
        weight: FontWeight.w600,
        height: 1.2,
        letterSpacing: -0.2,
        color: _ink,
      );

  TextStyle get heading3 => AppType.mono(
        size: 17,
        weight: FontWeight.w600,
        height: 1.3,
        letterSpacing: 0,
        color: _ink,
      );

  TextStyle get bodyLg => AppType.sans(
        size: 18,
        weight: FontWeight.w400,
        height: 1.65,
        color: _inkSoft,
      );

  TextStyle get body => AppType.sans(
        size: 15,
        weight: FontWeight.w400,
        height: 1.6,
        color: _inkSoft,
      );

  TextStyle get bodySm => AppType.sans(
        size: 13,
        weight: FontWeight.w400,
        height: 1.55,
        color: _inkMute,
      );

  TextStyle get monoBody => AppType.mono(
        size: 13,
        weight: FontWeight.w400,
        height: 1.55,
        color: _inkSoft,
      );

  TextStyle get monoBodySm => AppType.mono(
        size: 11,
        weight: FontWeight.w400,
        height: 1.5,
        color: _inkMute,
      );

  TextStyle get label => AppType.mono(
        size: 11,
        weight: FontWeight.w500,
        height: 1.0,
        letterSpacing: 1.6,
        color: _inkMute,
      );

  TextStyle get labelAccent => AppType.mono(
        size: 11,
        weight: FontWeight.w500,
        height: 1.0,
        letterSpacing: 1.6,
        color: _accent,
      );

  TextStyle get labelInk => AppType.mono(
        size: 11,
        weight: FontWeight.w500,
        height: 1.0,
        letterSpacing: 1.6,
        color: _ink,
      );

  TextStyle get button => AppType.mono(
        size: 12,
        weight: FontWeight.w500,
        height: 1.0,
        letterSpacing: 1.4,
        color: _ink,
      );

  TextStyle get buttonOnAccent => AppType.mono(
        size: 12,
        weight: FontWeight.w500,
        height: 1.0,
        letterSpacing: 1.4,
        color: const Color(0xFF0B0C0A),
      );

  TextStyle get number => AppType.mono(
        size: 14,
        weight: FontWeight.w500,
        letterSpacing: 0.5,
        color: _inkMute,
      );
}
