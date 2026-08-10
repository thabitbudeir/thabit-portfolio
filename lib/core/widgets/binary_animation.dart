import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class BinaryBackground extends StatefulWidget {
  final double height;
  const BinaryBackground({super.key, required this.height});

  @override
  State<BinaryBackground> createState() => _BinaryBackgroundState();
}

class _BinaryBackgroundState extends State<BinaryBackground> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final List<_Bit> _bits = [];
  final math.Random _random = math.Random();
  
  // Pre-cached text painters for performance
  late TextPainter _tp0;
  late TextPainter _tp1;

  @override
  void initState() {
    super.initState();
    
    _tp0 = _createPainter("0");
    _tp1 = _createPainter("1");

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(_updateBits)..repeat();

    for (int i = 0; i < 30; i++) {
      _bits.add(_createBit(initial: true));
    }
  }

  TextPainter _createPainter(String text) {
    return TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: AppColors.accent,
          fontSize: 10,
          fontFamily: 'monospace',
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
  }

  void _updateBits() {
    if (!mounted) return;
    setState(() {
      for (int i = 0; i < _bits.length; i++) {
        _bits[i].y += _bits[i].speed;
        if (_bits[i].y > 1.2) {
          _bits[i] = _createBit();
        }
      }
    });
  }

  _Bit _createBit({bool initial = false}) {
    return _Bit(
      x: _random.nextDouble(),
      y: initial ? _random.nextDouble() : -0.2,
      value: _random.nextBool() ? "0" : "1",
      speed: 0.004 + _random.nextDouble() * 0.008,
      opacity: 0.1 + _random.nextDouble() * 0.25,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary( // Optimization: Isolate this painting layer
      child: CustomPaint(
        painter: _BinaryPainter(_bits, _tp0, _tp1),
        size: Size(double.infinity, widget.height),
      ),
    );
  }
}

class _Bit {
  double x, y;
  String value;
  double speed;
  double opacity;
  _Bit({required this.x, required this.y, required this.value, required this.speed, required this.opacity});
}

class _BinaryPainter extends CustomPainter {
  final List<_Bit> bits;
  final TextPainter tp0;
  final TextPainter tp1;
  _BinaryPainter(this.bits, this.tp0, this.tp1);

  @override
  void paint(Canvas canvas, Size size) {
    for (var bit in bits) {
      final painter = bit.value == "0" ? tp0 : tp1;
      canvas.save();
      canvas.translate(bit.x * size.width, bit.y * size.height);
      // Paint with specific opacity without re-layout
      painter.paint(canvas, Offset.zero); 
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _BinaryPainter oldDelegate) => true;
}
