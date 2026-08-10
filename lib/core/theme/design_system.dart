import 'package:flutter/material.dart';

/// Spacing scale — based on a 4pt baseline grid.
/// Names are semantic, not numerical, so the system can evolve.
class AppSpacing {
  static const double micro = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 20;
  static const double xl = 32;
  static const double xxl = 48;
  static const double xxxl = 72;
  static const double huge = 112;
  static const double massive = 160;
}

/// Border radius — tight, almost-square by default.
/// Distinct from the standard "rounded everything" portfolio look.
class AppRadius {
  static const double none = 0;
  static const double xs = 2;
  static const double sm = 4;
  static const double md = 6;
  static const double lg = 10;
  static const double pill = 999;
}

/// Motion tokens — shorter, more deliberate than the previous system.
/// Animation is used as a *punctuation mark*, not a wallpaper.
class AppMotion {
  static const Duration instant = Duration(milliseconds: 80);
  static const Duration fast = Duration(milliseconds: 160);
  static const Duration base = Duration(milliseconds: 260);
  static const Duration slow = Duration(milliseconds: 420);
  static const Duration reveal = Duration(milliseconds: 640);

  static const Curve emphasized = Cubic(0.2, 0.0, 0.0, 1.0);
  static const Curve standard = Cubic(0.4, 0.0, 0.2, 1.0);
  static const Curve decelerate = Cubic(0.0, 0.0, 0.2, 1.0);
  static const Curve accelerate = Cubic(0.4, 0.0, 1.0, 1.0);
}

/// Breakpoints — same philosophy, slightly wider desktop.
class AppBreakpoints {
  static const double mobile = 640;
  static const double tablet = 960;
  static const double desktop = 1200;
  static const double wide = 1480;
}

class AppLayout {
  static const double maxWidth = 1280;
  static const double readingWidth = 680;
  static const double sectionPadDesktop = 96;
  static const double sectionPadTablet = 48;
  static const double sectionPadMobile = 20;
  static const double navHeight = 72;
  static const double sectionGap = 144;
}
