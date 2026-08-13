import 'package:flutter/material.dart';
import 'signature_mark.dart';


class SignatureAssets {

  static const String userSignaturePath = 'assets/signature/signature.png';

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
