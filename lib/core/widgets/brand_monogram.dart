import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/design_system.dart';
import '../theme/typography.dart';


class BrandMonogram extends StatelessWidget {
  final double height;
  final bool isLightMark;
  final EdgeInsetsGeometry? padding;

  const BrandMonogram({
    super.key,
    this.height = 32,
    this.isLightMark = false,
    this.padding,
  });

  static Widget mark({
    BoxFit fit = BoxFit.contain,
    double height = 32,
    EdgeInsetsGeometry? padding,
  }) {
    return Builder(
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return BrandMonogram(
          height: height,
          isLightMark: isDark,
          padding: padding,
        );
      },
    );
  }

  static const String lightMarkPath =
      'assets/my_visual_identy/monogram_icon-removebg-preview.png';
  static const String darkMarkPath =
      'assets/my_visual_identy/primary_logo-removebg-preview.png';

  String get _path => isLightMark ? lightMarkPath : darkMarkPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Image.asset(
        _path,
        height: height,
        fit: BoxFit.contain,
        color: isLightMark
            ? (Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkAccent
                  : AppColors.lightInk)
            : (Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkInk
                  : AppColors.lightAccent),
        errorBuilder: (context, error, stack) => _FallbackMark(
          height: height,
          tint: (Theme.of(context).brightness == Brightness.dark)
              ? AppColors.darkAccent
              : AppColors.lightAccent,
        ),
        semanticLabel: 'TB monogram',
      ),
    );
  }
}

class BrandLockup extends StatelessWidget {
  final double logoHeight;
  final VoidCallback? onTap;
  const BrandLockup({super.key, this.logoHeight = 30, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Thabit Budeir — home',
      child: FocusableActionDetector(
        mouseCursor: SystemMouseCursors.click,
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) => onTap?.call(),
          ),
        },
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              BrandMonogram.mark(height: logoHeight),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'THABIT BUDEIR',
                style: AppText.of(
                  context,
                ).labelInk.copyWith(letterSpacing: 2.2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _FallbackMark extends StatelessWidget {
  final double height;
  final Color tint;
  const _FallbackMark({required this.height, required this.tint});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Text(
        'TB',
        style: AppTypeSerif.from(context).copyWith(
          fontSize: height * 0.8,
          height: 1,
          color: tint,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class AppTypeSerif {
  const AppTypeSerif._();
  static TextStyle from(BuildContext context) {
    return AppText.of(context).display1.copyWith(fontSize: 24);
  }
}
