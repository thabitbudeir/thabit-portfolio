import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../utils/motion_policy.dart';


class BinaryBackground extends StatefulWidget {
  final double height;
  const BinaryBackground({super.key, required this.height});

  @override
  State<BinaryBackground> createState() => _BinaryBackgroundState();
}

class _BinaryBackgroundState extends State<BinaryBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final List<_Bit> _bits = [];
  final math.Random _random = math.Random();

  late TextPainter _tp0;
  late TextPainter _tp1;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );


    for (int i = 0; i < 18; i++) {
      _bits.add(_createBit(initial: true));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tp0 = _createPainter("0");
    _tp1 = _createPainter("1");
    if (MotionPolicy.shouldAnimate(context)) {
      if (!_controller.isAnimating) _controller.repeat();
    } else {
      _controller.stop();
    }
  }

  TextPainter _createPainter(String text) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final tint = isDark ? AppColors.darkAccent : AppColors.lightAccent;
    return TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: tint.withValues(alpha: 0.15),
          fontSize: 10,
          fontFamily: 'monospace',
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
  }

  _Bit _createBit({bool initial = false}) {
    return _Bit(
      x: _random.nextDouble(),
      y: initial ? _random.nextDouble() * 1.5 - 0.2 : -0.2,
      value: _random.nextBool() ? "0" : "1",
      speed: 0.001 + _random.nextDouble() * 0.002,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        painter: _BinaryPainter(
          bits: _bits,
          tp0: _tp0,
          tp1: _tp1,
          repaint: _controller,
          onCreateBit: () => _createBit(),
        ),
        size: Size(double.infinity, widget.height),
      ),
    );
  }
}

class _Bit {
  double x, y;
  String value;
  final double speed;
  _Bit({
    required this.x,
    required this.y,
    required this.value,
    required this.speed,
  });
}

class _BinaryPainter extends CustomPainter {
  final List<_Bit> bits;
  final TextPainter tp0;
  final TextPainter tp1;
  final _Bit Function() onCreateBit;

  _BinaryPainter({
    required this.bits,
    required this.tp0,
    required this.tp1,
    required this.onCreateBit,
    required Listenable repaint,
  }) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < bits.length; i++) {
      final bit = bits[i];

      bit.y += bit.speed;
      if (bit.y > 1.2) {
        bits[i] = onCreateBit();
      }

      final painter = bit.value == "0" ? tp0 : tp1;

      canvas.save();
      canvas.translate(bit.x * size.width, bit.y * size.height);

      painter.paint(canvas, Offset.zero);

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _BinaryPainter oldDelegate) => true;
}
