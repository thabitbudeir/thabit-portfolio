import 'package:flutter/material.dart';
import '../../../core/theme/design_system.dart';
import '../../../core/widgets/ui_primitives.dart';

class LogoStrip extends StatelessWidget {
  const LogoStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final opacity = isDark ? 0.5 : 0.4;

    return SectionShell(
      tight: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
        child: Opacity(
          opacity: opacity,
          child: Wrap(
            spacing: AppSpacing.xxxl,
            runSpacing: AppSpacing.xl,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _LogoItem(path: 'assets/logos/unrwa.png', height: 32),
              _LogoItem(path: 'assets/logos/anthropic.png', height: 26),
              _LogoItem(path: 'assets/logos/sham_university.png', height: 38),
              _LogoItem(path: 'assets/logos/programming_advices.png', height: 38),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoItem extends StatelessWidget {
  final String path;
  final double height;

  const _LogoItem({required this.path, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      height: height,
      filterQuality: FilterQuality.high,
      fit: BoxFit.contain,
    );
  }
}
