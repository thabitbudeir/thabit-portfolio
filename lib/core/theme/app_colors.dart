import 'package:flutter/material.dart';


class AppColors {
  static const Color charcoal = Color(0xFF1A1D21);
  static const Color offWhite = Color(0xFFF6F6F4);
  static const Color silver = Color(0xFFBFC3C9);

  static const Color lightBackground = offWhite;
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceAlt = Color(0xFFEFEFEC);
  static const Color lightInk = charcoal;
  static const Color lightInkSoft = Color(0xFF43484E);
  static const Color lightInkMute = Color(0xFF7C828A);
  static const Color lightLine = Color(0xFFE3E5E8);
  static const Color lightDivider = Color(0xFFECEEF0);

  static const Color lightAccent = charcoal;
  static const Color lightAccentHover = Color(0xFF2A2E34);
  static const Color lightAccentSoft = Color(0xFFE9EBED);
  static const Color lightAccentDim = Color(0x121A1D21); // ~7%
  static const Color lightAccentTrace = Color(0x081A1D21); // ~3%
  static const Color lightOnAccent = offWhite;

  static const Color darkBackground = Color(0xFF101214);
  static const Color darkSurface = charcoal; // exact brand charcoal
  static const Color darkSurfaceAlt = Color(0xFF22262B);
  static const Color darkInk = offWhite;
  static const Color darkInkSoft = silver;
  static const Color darkInkMute = Color(0xFF8B9098);
  static const Color darkLine = Color(0xFF2B2F34);
  static const Color darkDivider = Color(0xFF24282D);

  static const Color darkAccent = silver;
  static const Color darkAccentHover = Color(0xFFD7DBDF);
  static const Color darkAccentSoft = Color(0xFF3A4148);
  static const Color darkAccentDim = Color(0x26BFC3C9); // ~15%
  static const Color darkAccentTrace = Color(0x14BFC3C9); // ~8%
  static const Color darkOnAccent = charcoal;

  static const Color success = Color(0xFF2E7D5B);
  static const Color warning = Color(0xFFB7791F);
  static const Color danger = Color(0xFFC0392B);


  static const Color accent = lightAccent;
  static const Color accentDeep = lightAccentHover;
  static const Color accentSoft = lightAccentSoft;
  static const Color accentDim = lightAccentDim;
  static const Color accentTrace = lightAccentTrace;
  static const Color onAccent = lightOnAccent;
}


extension BrandAccent on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  Color get accent => isDarkMode ? AppColors.darkAccent : AppColors.lightAccent;
  Color get accentHover =>
      isDarkMode ? AppColors.darkAccentHover : AppColors.lightAccentHover;
  Color get accentSoft =>
      isDarkMode ? AppColors.darkAccentSoft : AppColors.lightAccentSoft;
  Color get accentDim =>
      isDarkMode ? AppColors.darkAccentDim : AppColors.lightAccentDim;
  Color get accentTrace =>
      isDarkMode ? AppColors.darkAccentTrace : AppColors.lightAccentTrace;
  Color get onAccent =>
      isDarkMode ? AppColors.darkOnAccent : AppColors.lightOnAccent;

  Color get line => isDarkMode ? AppColors.darkLine : AppColors.lightLine;
  Color get divider =>
      isDarkMode ? AppColors.darkDivider : AppColors.lightDivider;
  Color get surface =>
      isDarkMode ? AppColors.darkSurface : AppColors.lightSurface;
  Color get surfaceAlt =>
      isDarkMode ? AppColors.darkSurfaceAlt : AppColors.lightSurfaceAlt;
  Color get ink => isDarkMode ? AppColors.darkInk : AppColors.lightInk;
  Color get inkSoft =>
      isDarkMode ? AppColors.darkInkSoft : AppColors.lightInkSoft;
  Color get inkMute =>
      isDarkMode ? AppColors.darkInkMute : AppColors.lightInkMute;
  Color get background =>
      isDarkMode ? AppColors.darkBackground : AppColors.lightBackground;
}
