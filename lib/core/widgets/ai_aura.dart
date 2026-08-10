import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AIAura extends StatefulWidget {
  final double size;
  const AIAura({super.key, this.size = 200});

  @override
  State<AIAura> createState() => _AIAuraState();
}

class _AIAuraState extends State<AIAura> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary( // Optimization: Isolate this heavy animation
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            size: Size(widget.size, widget.size),
            painter: _AIPainter(_controller.value),
          );
        },
      ),
    );
  }
}

class _AIPainter extends CustomPainter {
  final double progress;
  _AIPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    // Drawing fewer circles with more simplified noise for performance
    for (int i = 0; i < 2; i++) {
      final p = (progress + (i * 0.5)) % 1.0;
      final opacity = (1.0 - p).clamp(0.0, 0.2);
      
      paint.color = AppColors.accent.withOpacity(opacity);
      
      final currentRadius = radius * p;
      final path = Path();
      
      // Increased step from 5 to 10 degrees to reduce points by 50%
      for (int j = 0; j <= 360; j += 10) {
        final radians = j * math.pi / 180;
        // Smoother, less frequent noise calculation
        final noise = math.sin(radians * 3 + progress * 5) * 4;
        final x = center.dx + (currentRadius + noise) * math.cos(radians);
        final y = center.dy + (currentRadius + noise) * math.sin(radians);
        
        if (j == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _AIPainter oldDelegate) => 
      oldDelegate.progress != progress;
}
