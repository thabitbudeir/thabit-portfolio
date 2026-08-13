import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../theme/design_system.dart';
import '../utils/motion_policy.dart';


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
  Animation<double>? _animation;
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
    _animation = CurvedAnimation(
      parent: _controller!,
      curve: AppMotion.decelerate,
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
    if (!MotionPolicy.shouldAnimate(context)) {
      _controller!.value = 1;
      return;
    }
    if (widget.delay == Duration.zero) {
      _controller!.forward();
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
        animation: _animation!,
        builder: (context, child) {
          final v = _animation!.value;
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


class HeroEntrance extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final double translateY;
  final double scaleFrom;
  final Duration duration;

  const HeroEntrance({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.translateY = 28,
    this.scaleFrom = 0.98,
    this.duration = const Duration(milliseconds: 700),
  });

  @override
  State<HeroEntrance> createState() => _HeroEntranceState();
}

class _HeroEntranceState extends State<HeroEntrance>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _progress;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialization based on InheritedWidgets (MediaQuery / MotionPolicy)
    // must happen here, not in initState.
    if (_controller != null) return;
    final animate = MotionPolicy.shouldAnimate(context);
    _controller = AnimationController(
      vsync: this,
      duration: animate ? widget.duration : Duration.zero,
    );
    _progress = CurvedAnimation(
      parent: _controller!,
      curve: AppMotion.decelerate,
    );
    if (!animate) {
      _controller!.value = 1;
    } else if (widget.delay == Duration.zero) {
      _controller!.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) _controller!.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    final progress = _progress;
    if (controller == null || progress == null) return widget.child;
    return AnimatedBuilder(
      animation: progress,
      child: widget.child,
      builder: (context, child) {
        final v = progress.value;
        return Opacity(
          opacity: v,
          child: Transform.translate(
            offset: Offset(0, widget.translateY * (1 - v)),
            child: Transform.scale(
              scale: 1 + (widget.scaleFrom - 1) * (1 - v),
              child: child,
            ),
          ),
        );
      },
    );
  }
}


class SmoothLift extends StatefulWidget {
  final Widget child;
  final double lift;
  final bool enabled;

  const SmoothLift({
    super.key,
    required this.child,
    this.lift = 3,
    this.enabled = true,
  });

  @override
  State<SmoothLift> createState() => _SmoothLiftState();
}

class _SmoothLiftState extends State<SmoothLift> {
  double _offset = 0;

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) return widget.child;
    return MouseRegion(
      onEnter: (_) => setState(() => _offset = -widget.lift),
      onExit: (_) => setState(() => _offset = 0),
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: _offset),
        duration: AppMotion.base,
        curve: AppMotion.standard,
        builder: (context, value, child) =>
            Transform.translate(offset: Offset(0, value), child: child),
        child: widget.child,
      ),
    );
  }
}
