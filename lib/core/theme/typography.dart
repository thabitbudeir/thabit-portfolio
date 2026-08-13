import 'package:flutter/material.dart';
import 'app_colors.dart';


class AppType {
  static const List<String> serifStack = [
    'Didot',
    'Bodoni 72',
    'Bodoni MT',
    'Didot LT STD',
    'Bodoni Moda',
    'Playfair Display',
    'Georgia',
    'Times New Roman',
    'serif',
  ];

  static const List<String> serifArabicStack = [
    'Noto Naskh Arabic',
    'Geeza Pro',
    'Serif',
  ];

  static const List<String> sansStack = [
    '-apple-system',
    'BlinkMacSystemFont',
    'SF Pro Display',
    'Segoe UI',
    'Inter',
    'Montserrat',
    'Helvetica Neue',
    'Arial',
    'sans-serif',
    'Apple Color Emoji',
    'Segoe UI Emoji',
  ];

  static const List<String> sansArabicStack = [
    'Cairo',
    'Tajawal',
    'Noto Sans Arabic',
    'Geeza Pro',
    'Segoe UI',
    'sans-serif',
  ];

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

  static TextStyle serif({
    required double size,
    FontWeight weight = FontWeight.w600,
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
      fontFamilyFallback: [...serifStack, ...serifArabicStack],
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
      fontFamilyFallback: [...sansStack, ...sansArabicStack],
    );
  }

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
}

class AppText extends InheritedWidget {
  final AppTextStyles styles;

  const AppText({super.key, required this.styles, required super.child});

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
    return AppText(styles: AppTextStyles(isDark), child: child);
  }
}

class AppTextStyles {
  AppTextStyles._(this.isDark);

  factory AppTextStyles(bool isDark) => AppTextStyles._(isDark);

  final bool isDark;
  Color get _ink => isDark ? AppColors.darkInk : AppColors.lightInk;
  Color get _inkSoft => isDark ? AppColors.darkInkSoft : AppColors.lightInkSoft;
  Color get _inkMute => isDark ? AppColors.darkInkMute : AppColors.lightInkMute;
  Color get _accent => isDark ? AppColors.darkAccent : AppColors.lightAccent;
  Color get _onAccent =>
      isDark ? AppColors.darkOnAccent : AppColors.lightOnAccent;


  TextStyle get display1 => AppType.serif(
    size: 88,
    weight: FontWeight.w600,
    height: 0.96,
    letterSpacing: -1.5,
    color: _ink,
  );

  TextStyle get display2 => AppType.serif(
    size: 64,
    weight: FontWeight.w600,
    height: 1.0,
    letterSpacing: -0.8,
    color: _ink,
  );

  TextStyle get display3 => AppType.serif(
    size: 44,
    weight: FontWeight.w600,
    height: 1.08,
    letterSpacing: -0.4,
    color: _ink,
  );

  TextStyle get heading1 => AppType.serif(
    size: 32,
    weight: FontWeight.w600,
    height: 1.12,
    letterSpacing: -0.2,
    color: _ink,
  );


  TextStyle get heading2 => AppType.sans(
    size: 22,
    weight: FontWeight.w600,
    height: 1.2,
    letterSpacing: -0.2,
    color: _ink,
  );

  TextStyle get heading3 => AppType.sans(
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

  TextStyle get button => AppType.sans(
    size: 12,
    weight: FontWeight.w600,
    height: 1.0,
    letterSpacing: 1.2,
    color: _ink,
  );

  TextStyle get buttonOnAccent => AppType.sans(
    size: 12,
    weight: FontWeight.w600,
    height: 1.0,
    letterSpacing: 1.2,
    color: _onAccent,
  );

  TextStyle get number => AppType.mono(
    size: 14,
    weight: FontWeight.w500,
    letterSpacing: 0.5,
    color: _inkMute,
  );
}
