import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/design_system.dart';
import '../theme/typography.dart';


class SectionShell extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? maxWidth;
  final bool tight;
  final String? id;

  const SectionShell({
    super.key,
    required this.child,
    this.padding,
    this.maxWidth,
    this.tight = false,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final horizontal = w >= AppBreakpoints.desktop
        ? AppLayout.sectionPadDesktop
        : w >= AppBreakpoints.tablet
            ? AppLayout.sectionPadTablet
            : AppLayout.sectionPadMobile;

    final vPad = tight ? AppSpacing.xxl : AppLayout.sectionGap;
    final clampedWidth = maxWidth ?? AppLayout.maxWidth;

    return Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: horizontal, vertical: vPad),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: clampedWidth),
          child: child,
        ),
      ),
    );
  }
}


class SectionHeader extends StatelessWidget {
  final String label;
  final String title;
  final String? subtitle;
  final TextAlign align;
  final Widget? trailing;

  const SectionHeader({
    super.key,
    required this.label,
    required this.title,
    this.subtitle,
    this.align = TextAlign.start,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lineColor = isDark ? AppColors.darkLine : AppColors.lightLine;

    final header = Column(
      crossAxisAlignment: align == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24,
              height: 1,
              color: AppColors.accent,
            ),
            const SizedBox(width: AppSpacing.md),
            Text(label.toUpperCase(), style: t.labelAccent),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          title,
          style: t.display3,
          textAlign: align,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: AppSpacing.lg),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: AppLayout.readingWidth),
            child: Text(
              subtitle!,
              style: t.bodyLg,
              textAlign: align,
            ),
          ),
        ],
        const SizedBox(height: AppSpacing.lg),
        Container(
          width: 64,
          height: 1,
          color: lineColor,
        ),
      ],
    );

    if (trailing == null) return header;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(child: header),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class Hairline extends StatelessWidget {
  final bool vertical;
  final double? indent;
  final double? endIndent;
  final Color? color;
  final double thickness;
  const Hairline({
    super.key,
    this.vertical = false,
    this.indent,
    this.endIndent,
    this.color,
    this.thickness = 1,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final c = color ?? (isDark ? AppColors.darkLine : AppColors.lightLine);
    if (vertical) {
      return Container(width: thickness, color: c);
    }
    return Container(height: thickness, color: c);
  }
}
