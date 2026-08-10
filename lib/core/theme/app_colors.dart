import 'package:flutter/material.dart';

/// Technical Mono palette.
/// Designed for a Flutter developer identity — clean, technical, distinctive.
/// No purple gradient. No generic neutral. The accent is Electric Mint:
/// a single, deliberate signature color used sparingly.
class AppColors {
  // ─── Light mode ─────────────────────────────────────────────
  // Paper-white background with cool undertones, never pure white.
  static const Color lightBackground = Color(0xFFF6F6F4);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceAlt = Color(0xFFEFEFEC);
  static const Color lightInk = Color(0xFF0E0F0C);
  static const Color lightInkSoft = Color(0xFF3A3C36);
  static const Color lightInkMute = Color(0xFF6B6E66);
  static const Color lightLine = Color(0xFFE2E2DC);
  static const Color lightDivider = Color(0xFFEAEAE4);

  // ─── Dark mode ──────────────────────────────────────────────
  // Deep ink, not pure black. Slight warm undertone to keep it human.
  static const Color darkBackground = Color(0xFF0B0C0A);
  static const Color darkSurface = Color(0xFF131511);
  static const Color darkSurfaceAlt = Color(0xFF1A1C17);
  static const Color darkInk = Color(0xFFF2F2EC);
  static const Color darkInkSoft = Color(0xFFB8B9B1);
  static const Color darkInkMute = Color(0xFF74766E);
  static const Color darkLine = Color(0xFF24261F);
  static const Color darkDivider = Color(0xFF1E201B);

  // ─── Accent — Electric Mint ────────────────────────────────
  // The single color that defines the identity.
  // Used sparingly: active state, primary CTA, key highlights, signature mark.
  static const Color accent = Color(0xFF00D9A6);
  static const Color accentDeep = Color(0xFF00B387);
  static const Color accentSoft = Color(0xFF6FF0CD);
  static const Color accentDim = Color(0x3300D9A6); // 20% alpha
  static const Color accentTrace = Color(0x1400D9A6); // 8% alpha

  // ─── Semantic ───────────────────────────────────────────────
  static const Color success = Color(0xFF00D9A6);
  static const Color warning = Color(0xFFE8B931);
  static const Color danger = Color(0xFFE5554A);
}
