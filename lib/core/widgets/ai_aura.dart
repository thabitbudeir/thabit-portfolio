import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../theme/app_colors.dart';
import '../utils/motion_policy.dart';

class AIAura extends StatefulWidget {
  final double size;
  const AIAura({super.key, this.size = 200});

  @override
  State<AIAura> createState() => _AIAuraState();
}

class _AIAuraState extends State<AIAura> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateAnimationState();
  }

  void _updateAnimationState() {
    if (!mounted) return;
    final shouldAnimate = MotionPolicy.shouldAnimate(context) && _isVisible;
    if (shouldAnimate) {
      if (!_controller.isAnimating) _controller.repeat();
    } else {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // VisibilityDetector pauses the animation when off-screen
    return VisibilityDetector(
      key: const ValueKey('ai_aura_visibility'),
      onVisibilityChanged: (info) {
        final visible = info.visibleFraction > 0;
        if (visible != _isVisible) {
          _isVisible = visible;
          _updateAnimationState();
        }
      },
      child: RepaintBoundary(
        child: CustomPaint(
          size: Size(widget.size, widget.size),
          // Pass the controller as repaint to the painter
          painter: _AIPainter(repaint: _controller),
        ),
      ),
    );
  }
}

class _AIPainter extends CustomPainter {
  final Animation<double> _animation;

  _AIPainter({required Animation<double> repaint})
    : _animation = repaint,
      super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    final progress = _animation.value;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    for (int i = 0; i < 2; i++) {
      final p = (progress + (i * 0.5)) % 1.0;
      final opacity = (1.0 - p).clamp(0.0, 0.2);

      paint.color = AppColors.accent.withValues(alpha: opacity);

      final currentRadius = radius * p;
      final path = Path();

      // Points reduction: j += 15 for even less calculations per frame
      for (int j = 0; j <= 360; j += 15) {
        final radians = j * math.pi / 180;
        final noise = math.sin(radians * 3 + progress * 5) * 4;
        final x = center.dx + (currentRadius + noise) * math.cos(radians);
        final y = center.dy + (currentRadius + noise) * math.sin(radians);

        if (j == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _AIPainter oldDelegate) => false;
}
