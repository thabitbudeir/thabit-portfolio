import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// SignatureMark — A purely geometric, "Tech Logo" style monogram for "th".
/// 
/// Optimized for performance by using simple shapes and minimizing rebuilds.
class SignatureMark extends StatefulWidget {
  final double height;
  final Color? tint;
  final bool animated;
  final Duration animationDelay;

  const SignatureMark({
    super.key,
    this.height = 32,
    this.tint,
    this.animated = true,
    this.animationDelay = Duration.zero,
  });

  @override
  State<SignatureMark> createState() => _SignatureMarkState();
}

class _SignatureMarkState extends State<SignatureMark>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutExpo,
  );

  @override
  void initState() {
    super.initState();
    if (widget.animated) {
      Future.delayed(widget.animationDelay, () {
        if (mounted) _controller.forward();
      });
    } else {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = widget.tint ?? (isDark ? AppColors.accent : AppColors.lightInk);

    return RepaintBoundary( // Performance: Isolate the paint layer
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return CustomPaint(
            size: Size(widget.height * 1.5, widget.height),
            painter: _GeometricTHPainter(
              progress: _animation.value,
              color: color,
            ),
          );
        },
      ),
    );
  }
}

class _GeometricTHPainter extends CustomPainter {
  final double progress;
  final Color color;

  _GeometricTHPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) return;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.height * 0.12
      ..strokeCap = StrokeCap.square; 

    final w = size.width;
    final h = size.height;

    // The logic below is very lightweight as it uses simple line drawing.
    
    void drawLine(Offset p1, Offset p2, double startP, double endP) {
      if (progress < startP) return;
      final segmentP = ((progress - startP) / (endP - startP)).clamp(0.0, 1.0);
      canvas.drawLine(p1, Offset(p1.dx + (p2.dx - p1.dx) * segmentP, p1.dy + (p2.dy - p1.dy) * segmentP), paint);
    }

    // Geometric 't'
    drawLine(Offset(w * 0.2, h * 0.1), Offset(w * 0.2, h * 0.8), 0.0, 0.4); // Vertical
    drawLine(Offset(w * 0.05, h * 0.35), Offset(w * 0.35, h * 0.35), 0.2, 0.5); // Crossbar

    // Geometric 'h'
    drawLine(Offset(w * 0.5, h * 0.1), Offset(w * 0.5, h * 0.8), 0.3, 0.7); // Vertical
    drawLine(Offset(w * 0.5, h * 0.45), Offset(w * 0.8, h * 0.45), 0.6, 0.8); // Bridge
    drawLine(Offset(w * 0.8, h * 0.45), Offset(w * 0.8, h * 0.8), 0.8, 1.0); // Leg

    // Technical Underline
    final linePaint = Paint()
      ..color = color.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    
    if (progress > 0.8) {
      final lineP = ((progress - 0.8) / 0.2).clamp(0.0, 1.0);
      canvas.drawLine(Offset(w * 0.05, h * 0.95), Offset(w * 0.05 + (w * 0.9) * lineP, h * 0.95), linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant _GeometricTHPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}
