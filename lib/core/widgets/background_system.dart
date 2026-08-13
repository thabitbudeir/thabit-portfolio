import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class BackgroundSystem extends StatelessWidget {
  final Widget child;
  const BackgroundSystem({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
        ),
        Positioned.fill(
          child: RepaintBoundary(
            child: CustomPaint(
              painter: _BgPainter(isDark: isDark),
              isComplex: true,
              willChange: false,
            ),
          ),
        ),
        child,
      ],
    );
  }
}

class _BgPainter extends CustomPainter {
  final bool isDark;
  _BgPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final line = (isDark ? AppColors.darkLine : AppColors.lightLine)
        .withValues(alpha: 0.3);
    final mute = (isDark ? AppColors.darkInkMute : AppColors.lightInkMute)
        .withValues(alpha: 0.15);

    final majorPaint = Paint()
      ..color = line
      ..strokeWidth = 0.5;
    final minorPaint = Paint()
      ..color = mute
      ..strokeWidth = 0.5;

    const minor = 80.0;
    const major = 240.0;

    for (double x = 0; x <= size.width; x += minor) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), (x % major == 0) ? majorPaint : minorPaint);
    }
    for (double y = 0; y <= size.height; y += 120) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), minorPaint);
    }

    final tr = Rect.fromLTWH(size.width - 200, 72, 140, 88);
    canvas.drawRect(tr, Paint()..color = AppColors.accent.withValues(alpha: 0.03));
    canvas.drawRect(tr, Paint()..color = AppColors.accent.withValues(alpha: 0.1)..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(covariant _BgPainter oldDelegate) => oldDelegate.isDark != isDark;
}
