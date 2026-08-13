import 'package:flutter/material.dart';
import '../../../core/animations/animations.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/design_system.dart';
import '../../../core/theme/typography.dart';
import '../../../core/widgets/ai_aura.dart';
import '../../../core/widgets/brand_monogram.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/ui_primitives.dart';
import '../../../core/utils/cv_utils.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewProjects;
  final VoidCallback onContact;

  const HeroSection({
    super.key,
    required this.onViewProjects,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = width >= AppBreakpoints.desktop;
    final t = AppText.of(context);

    return SectionShell(
      tight: true,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: isDesktop ? 760 : 620),
        child: Stack(
          children: [
            // AI Animation: Subtle pulsing aura in the background
            const Positioned(
              top: 100,
              right: -50,
              child: IgnorePointer(child: AIAura(size: 400)),
            ),
            const Positioned.fill(
              child: IgnorePointer(
                child: RepaintBoundary(child: _HeroBlueprint()),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: isDesktop ? 96 : 56),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Entrance animation — staged fade/slide/scale sequence
                  HeroEntrance(
                    delay: const Duration(milliseconds: 60),
                    child: _EyebrowRow(t: t),
                  ),
                  SizedBox(height: isDesktop ? AppSpacing.xxxl : AppSpacing.xl),
                  HeroEntrance(
                    delay: const Duration(milliseconds: 120),
                    translateY: 36,
                    child: _Headline(t: t, isDesktop: isDesktop),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  HeroEntrance(
                    delay: const Duration(milliseconds: 240),
                    translateY: 24,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 560),
                      child: Text(AppStrings.heroTitle, style: t.bodyLg),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                  HeroEntrance(
                    delay: const Duration(milliseconds: 360),
                    translateY: 20,
                    child: _Actions(
                      onViewProjects: onViewProjects,
                      onContact: onContact,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                  HeroEntrance(
                    delay: const Duration(milliseconds: 480),
                    translateY: 16,
                    child: _BottomMetaRow(t: t),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EyebrowRow extends StatelessWidget {
  final AppTextStyles t;
  const _EyebrowRow({required this.t});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BrandMonogram.mark(height: 20),
        const SizedBox(width: AppSpacing.md),
        Text('00', style: t.labelAccent),
        const SizedBox(width: AppSpacing.md),
        Container(width: 24, height: 1, color: AppColors.accent),
        const SizedBox(width: AppSpacing.md),
        Flexible(
          child: Text(
            AppStrings.heroEyebrow,
            style: t.label,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _Headline extends StatelessWidget {
  final AppTextStyles t;
  final bool isDesktop;
  const _Headline({required this.t, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final size = isDesktop ? 112.0 : 52.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.heroLine1,
          style: t.display1.copyWith(fontSize: size, height: 0.98),
        ),
        const SizedBox(height: 6),
        RichText(
          text: TextSpan(
            style: t.display1.copyWith(fontSize: size, height: 0.98),
            children: [
              TextSpan(text: AppStrings.heroLine2Prefix),
              TextSpan(
                text: AppStrings.heroLine2Accent,
                style: TextStyle(color: AppColors.accent),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Actions extends StatelessWidget {
  final VoidCallback onViewProjects;
  final VoidCallback onContact;
  const _Actions({required this.onViewProjects, required this.onContact});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        AppButton(
          label: AppStrings.viewWork,
          onPressed: onViewProjects,
          showArrow: true,
        ),
        AppButton(
          label: AppStrings.viewCv,
          kind: ButtonKind.secondary,
          leadingIcon: Icons.description_outlined,
          onPressed: () => CVUtils.viewCV(),
        ),
        AppButton(
          label: AppStrings.downloadCv,
          kind: ButtonKind.ghost,
          leadingIcon: Icons.download_rounded,
          onPressed: () => CVUtils.downloadCV(),
        ),
      ],
    );
  }
}

class _BottomMetaRow extends StatelessWidget {
  final AppTextStyles t;
  const _BottomMetaRow({required this.t});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final line = isDark ? AppColors.darkLine : AppColors.lightLine;

    return Container(
      padding: const EdgeInsets.only(top: AppSpacing.lg),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: line, width: 1)),
      ),
      child: LayoutBuilder(
        builder: (context, c) {
          final wide = c.maxWidth > 720;
          final items = [
            _MetaItem(
              label: AppStrings.statusLabel,
              value: AppStrings.statusOpen,
            ),
            _MetaItem(
              label: AppStrings.focusLabel,
              value: AppStrings.focusValue,
            ),
            _MetaItem(
              label: AppStrings.basedInLabel,
              value: AppStrings.basedInValue,
            ),
          ];

          if (!wide) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .map(
                    (it) => Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: it,
                    ),
                  )
                  .toList(),
            );
          }

          return Row(
            children: items.expand((it) sync* {
              if (it != items.first) {
                yield Container(
                  width: 1,
                  height: 28,
                  color: line,
                  margin: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                );
              }
              yield Expanded(child: it);
            }).toList(),
          );
        },
      ),
    );
  }
}

class _MetaItem extends StatelessWidget {
  final String label;
  final String value;
  const _MetaItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: t.label),
        const SizedBox(height: 4),
        Text(value, style: t.monoBody),
      ],
    );
  }
}

class _HeroBlueprint extends StatelessWidget {
  const _HeroBlueprint();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomPaint(painter: _HeroBlueprintPainter(isDark: isDark));
  }
}

class _HeroBlueprintPainter extends CustomPainter {
  final bool isDark;
  _HeroBlueprintPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final accentStroke = Paint()
      ..color = AppColors.accent.withValues(alpha: isDark ? 0.16 : 0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final frame = Rect.fromLTWH(size.width - 280, 48, 200, 120);
    canvas.drawRect(frame, accentStroke);

    final cross = Paint()
      ..color = AppColors.accent.withValues(alpha: 0.22)
      ..strokeWidth = 0.5;
    canvas.drawLine(
      Offset(frame.left + 16, frame.center.dy),
      Offset(frame.right - 16, frame.center.dy),
      cross,
    );
    canvas.drawLine(
      Offset(frame.center.dx, frame.top + 16),
      Offset(frame.center.dx, frame.bottom - 16),
      cross,
    );

    final baseline = Paint()
      ..color = (isDark ? AppColors.darkInkMute : AppColors.lightInkMute)
          .withValues(alpha: 0.35)
      ..strokeWidth = 0.5;
    canvas.drawLine(
      Offset(0, size.height * 0.72),
      Offset(size.width, size.height * 0.72),
      baseline,
    );
  }

  @override
  bool shouldRepaint(covariant _HeroBlueprintPainter oldDelegate) =>
      oldDelegate.isDark != isDark;
}
