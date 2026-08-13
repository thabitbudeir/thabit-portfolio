import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../utils/motion_policy.dart';


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
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutExpo,
    );

    if (widget.animated) {
      Future.delayed(widget.animationDelay, () {
        if (mounted && MotionPolicy.shouldAnimate(context)) {
          _controller.forward();
        } else if (mounted) {
          _controller.value = 1.0;
        }
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

    return RepaintBoundary(
      child: CustomPaint(
        size: Size(widget.height * 1.5, widget.height),
        painter: _GeometricTHPainter(
          animation: _animation,
          color: color,
        ),
      ),
    );
  }
}

class _GeometricTHPainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;

  _GeometricTHPainter({required this.animation, required this.color})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final progress = animation.value;
    if (progress <= 0) return;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.height * 0.12
      ..strokeCap = StrokeCap.square; 

    final w = size.width;
    final h = size.height;

    void drawLine(Offset p1, Offset p2, double startP, double endP) {
      if (progress < startP) return;
      final segmentP = ((progress - startP) / (endP - startP)).clamp(0.0, 1.0);
      canvas.drawLine(p1, Offset(p1.dx + (p2.dx - p1.dx) * segmentP, p1.dy + (p2.dy - p1.dy) * segmentP), paint);
    }


    drawLine(Offset(w * 0.2, h * 0.1), Offset(w * 0.2, h * 0.8), 0.0, 0.4); 
    drawLine(Offset(w * 0.05, h * 0.35), Offset(w * 0.35, h * 0.35), 0.2, 0.5); 


    drawLine(Offset(w * 0.5, h * 0.1), Offset(w * 0.5, h * 0.8), 0.3, 0.7); 
    drawLine(Offset(w * 0.5, h * 0.45), Offset(w * 0.8, h * 0.45), 0.6, 0.8); 
    drawLine(Offset(w * 0.8, h * 0.45), Offset(w * 0.8, h * 0.8), 0.8, 1.0); 


    if (progress > 0.8) {
      final linePaint = Paint()
        ..color = color.withOpacity(0.5)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      final lineP = ((progress - 0.8) / 0.2).clamp(0.0, 1.0);
      canvas.drawLine(Offset(w * 0.05, h * 0.95), Offset(w * 0.05 + (w * 0.9) * lineP, h * 0.95), linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant _GeometricTHPainter oldDelegate) =>
      oldDelegate.color != color;
}
