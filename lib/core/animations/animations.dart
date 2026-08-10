import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../theme/design_system.dart';
import '../utils/motion_policy.dart';

/// RevealOnScroll — single-shot, GPU-friendly reveal.
///
/// Performance contract:
/// - Listens to a single [VisibilityDetector] per instance.
/// - Animates a 0→1 progress value once, then disposes the listener.
/// - Uses transform (translateY) + opacity only — no layout effects.
/// - Respects reduced-motion preferences.
class RevealOnScroll extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final double translateY;
  final bool once;
  final Duration duration;

  const RevealOnScroll({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.translateY = 16,
    this.once = true,
    this.duration = AppMotion.base,
  });

  @override
  State<RevealOnScroll> createState() => _RevealOnScrollState();
}

class _RevealOnScrollState extends State<RevealOnScroll>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  bool _started = false;
  bool _disposed = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_controller != null) return;
    final animate = MotionPolicy.shouldAnimate(context);
    _controller = AnimationController(
      vsync: this,
      duration: animate ? widget.duration : Duration.zero,
      value: animate ? 0 : 1,
    );
  }

  @override
  void dispose() {
    _disposed = true;
    _controller?.dispose();
    super.dispose();
  }

  void _start() {
    if (_started || _disposed || _controller == null) return;
    _started = true;
    if (!MotionPolicy.shouldAnimate(context) || widget.delay == Duration.zero) {
      _controller!.value = 1;
      return;
    }
    Future.delayed(widget.delay, () {
      if (_disposed || _controller == null) return;
      _controller!.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    if (controller == null) return widget.child;

    if (widget.once && _started && controller.value == 1) {
      return widget.child;
    }

    if (!MotionPolicy.shouldAnimate(context)) {
      return widget.child;
    }

    return VisibilityDetector(
      key: ValueKey('rev_${widget.key ?? identityHashCode(widget)}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.08) _start();
      },
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          final v = controller.value;
          return Opacity(
            opacity: v,
            child: Transform.translate(
              offset: Offset(0, widget.translateY * (1 - v)),
              child: child,
            ),
          );
        },
        child: widget.child,
      ),
    );
  }
}

/// Staggered reveal — incremental delays for list children.
class StaggeredReveal extends StatelessWidget {
  final List<Widget> children;
  final Duration stagger;
  final Duration initialDelay;
  final double translateY;

  const StaggeredReveal({
    super.key,
    required this.children,
    this.stagger = const Duration(milliseconds: 80),
    this.initialDelay = Duration.zero,
    this.translateY = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(children.length, (i) {
        return RevealOnScroll(
          delay: initialDelay + stagger * i,
          translateY: translateY,
          child: children[i],
        );
      }),
    );
  }
}
