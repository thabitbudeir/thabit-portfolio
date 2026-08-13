import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class MotionPolicy {
  MotionPolicy._();

  static bool of(BuildContext context) {
    final mq = MediaQuery.maybeOf(context);
    if (mq == null) return true;
    if (mq.disableAnimations) return false;
    return !SchedulerBinding.instance.platformDispatcher.accessibilityFeatures
        .disableAnimations;
  }

  static Duration duration(BuildContext context, Duration normal) {
    return of(context) ? normal : Duration.zero;
  }

  static bool shouldAnimate(BuildContext context) => of(context);
}
