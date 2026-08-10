import 'package:flutter/material.dart';
import 'signature_mark.dart';

/// Signature assets loader — gives the rest of the app a single way to
/// access the personal mark.
///
/// To plug in your scanned signature:
/// 1. Save the cleaned, transparent PNG at:
///      `assets/signature/signature.png`
///    (recommended: 800×240, transparent background, black ink, ~3px stroke)
/// 2. Run `flutter pub get`
/// 3. The [SignatureMark] widget will automatically pick it up
///    instead of using the hand-drawn fallback.
class SignatureAssets {
  /// Path to the user's scanned signature.
  /// When this asset does not exist, [SignatureMark] shows a hand-drawn fallback.
  static const String userSignaturePath = 'assets/signature/signature.png';

  /// The widget to embed anywhere a personal mark should appear.
  /// Reads the asset lazily; falls back gracefully if missing.
  static Widget mark({
    double height = 56,
    Color? tint,
    bool animated = true,
    Duration animationDelay = Duration.zero,
  }) {
    return SignatureMark(
      height: height,
      tint: tint,
      animated: animated,
      animationDelay: animationDelay,
    );
  }
}
