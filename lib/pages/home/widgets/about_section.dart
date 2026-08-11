import 'package:flutter/material.dart';
import '../../../core/animations/animations.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/design_system.dart';
import '../../../core/theme/typography.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/ui_primitives.dart';
import '../../../core/utils/cv_utils.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            label: AppStrings.sectionAbout,
            title: AppStrings.aboutHeadline,
          ),
          const SizedBox(height: AppSpacing.xxl),
          RevealOnScroll(
            child: LayoutBuilder(
              builder: (context, c) {
                final stacked = c.maxWidth < 980;
                return stacked
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _aboutText(context),
                          const SizedBox(height: AppSpacing.xl),
                          _aboutVisual(context),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 6, child: _aboutText(context)),
                          const SizedBox(width: AppSpacing.xl),
                          Expanded(flex: 4, child: _aboutVisual(context)),
                        ],
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _aboutText(BuildContext context) {
    final t = AppText.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.aboutP1, style: t.bodyLg),
        const SizedBox(height: AppSpacing.md),
        Text(AppStrings.aboutP2, style: t.bodyLg),
        const SizedBox(height: AppSpacing.md),
        Text(AppStrings.aboutP3, style: t.bodyLg),
        const SizedBox(height: AppSpacing.xl),

        // Resume Experience
        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          children: [
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
        ),

        const SizedBox(height: AppSpacing.xl),
        Container(
          padding: const EdgeInsets.only(top: AppSpacing.lg),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.accent, width: 1)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  AppStrings.thabitSignature,
                  style: t.monoBody.copyWith(
                    color: AppColors.accent,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _aboutVisual(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        border: Border.all(
          color: isDark ? AppColors.darkLine : AppColors.lightLine,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(AppStrings.profileLabel, style: t.labelAccent),
              const SizedBox(width: AppSpacing.sm),
              Text(AppStrings.layersLabel, style: t.label),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          SizedBox(
            height: 200,
            child: RepaintBoundary(
              child: CustomPaint(painter: _AboutPainter(isDark: isDark)),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          _statRow(
            context,
            AppStrings.statEngineer,
            AppStrings.aboutStatValueCsAi,
          ),
          _statRow(
            context,
            AppStrings.statBuilder,
            AppStrings.aboutStatValueFlutter,
          ),
          _statRow(
            context,
            AppStrings.statDesigner,
            AppStrings.aboutStatValueUiUx,
          ),
          _statRow(
            context,
            AppStrings.statLanguages,
            AppStrings.aboutStatValueLangs,
          ),
        ],
      ),
    );
  }

  Widget _statRow(BuildContext context, String label, String value) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isDark ? AppColors.darkLine : AppColors.lightLine,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: t.label),
          Text(value, style: t.monoBody.copyWith(letterSpacing: 0.5)),
        ],
      ),
    );
  }
}

class _AboutPainter extends CustomPainter {
  final bool isDark;
  _AboutPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final accentPaint = Paint()
      ..color = AppColors.accent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;
    final inkPaint = Paint()
      ..color = (isDark ? AppColors.darkInkMute : AppColors.lightInkMute)
          .withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.7;

    final cx = size.width / 2;
    final cy = size.height / 2;

    for (int i = 0; i < 4; i++) {
      final s = 30.0 + i * 28;
      canvas.drawRect(
        Rect.fromCenter(center: Offset(cx, cy), width: s, height: s),
        i == 0 ? accentPaint : inkPaint,
      );
    }
    for (int i = 0; i < 4; i++) {
      final r = 20.0 + i * 24;
      canvas.drawCircle(Offset(cx, cy), r, inkPaint);
    }

    canvas.drawLine(Offset(0, cy), Offset(size.width, cy), inkPaint);
    canvas.drawLine(Offset(cx, 0), Offset(cx, size.height), inkPaint);

    final nodes = [
      const Offset(8, 8),
      Offset(size.width - 8, 8),
      Offset(8, size.height - 8),
      Offset(size.width - 8, size.height - 8),
    ];
    for (final n in nodes) {
      canvas.drawCircle(
        n,
        3,
        Paint()
          ..color = AppColors.accent
          ..style = PaintingStyle.fill,
      );
    }

    final diag = Paint()
      ..color = AppColors.accent.withValues(alpha: 0.3)
      ..strokeWidth = 1;
    canvas.drawLine(
      Offset(0, size.height * 0.3),
      Offset(size.width, size.height * 0.7),
      diag,
    );
  }

  @override
  bool shouldRepaint(covariant _AboutPainter oldDelegate) =>
      oldDelegate.isDark != isDark;
}
