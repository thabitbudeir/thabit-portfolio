import 'package:flutter/material.dart';
import '../../../core/animations/animations.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/design_system.dart';
import '../../../core/theme/typography.dart';
import '../../../core/widgets/editorial_card.dart';
import '../../../core/widgets/ui_primitives.dart';

class CurrentWorkSection extends StatelessWidget {
  const CurrentWorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      _CurrentProject(
        name: 'AURIX',
        subtitle: 'Smart Tender Management System',
        progress: 0.75,
        status: 'IN DEVELOPMENT',
        focus: ['AI Document Verification', 'Decision Engine', 'Dashboard Polish'],
        stage: 2,
      ),
      _CurrentProject(
        name: 'Portfolio System',
        subtitle: 'Personal brand platform',
        progress: 0.48,
        status: 'IN DEVELOPMENT',
        focus: ['Motion UX', 'Localization', 'Design System'],
        stage: 2,
      ),
    ];

    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            label: AppStrings.sectionCurrent,
            title: AppStrings.get(
                'Currently working on.',
                'ما أعمل عليه الآن.',
                'Woran ich gerade arbeite.'),
            subtitle: AppStrings.get(
              'A live look at what is in motion right now.',
              'نظرة مباشرة على ما يتم بناؤه الآن.',
              'Ein aktueller Blick auf laufende Arbeit.',
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          ...projects.asMap().entries.map((entry) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: entry.key == projects.length - 1
                    ? 0
                    : AppSpacing.lg,
              ),
              child: RevealOnScroll(
                delay: Duration(milliseconds: 120 * entry.key),
                child: _CurrentWorkCard(project: entry.value),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _CurrentProject {
  final String name;
  final String subtitle;
  final double progress;
  final String status;
  final List<String> focus;
  final int stage;
  _CurrentProject({
    required this.name,
    required this.subtitle,
    required this.progress,
    required this.status,
    required this.focus,
    required this.stage,
  });
}

class _CurrentWorkCard extends StatelessWidget {
  final _CurrentProject project;
  const _CurrentWorkCard({required this.project});

  @override
  Widget build(BuildContext context) {
    final stages = [
      'Planning',
      'Design',
      'Development',
      'Testing',
      'Deploy',
    ];
    return EditorialCard(
      number: 'NOW',
      tag: project.status,
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: LayoutBuilder(
        builder: (context, c) {
          final stacked = c.maxWidth < 850;
          return stacked
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _left(context, stages),
                    const SizedBox(height: AppSpacing.xl),
                    Hairline(),
                    const SizedBox(height: AppSpacing.xl),
                    _right(context, stages),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _left(context, stages)),
                    const SizedBox(width: AppSpacing.xl),
                    Container(
                      width: 1,
                      height: 220,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.darkLine
                          : AppColors.lightLine,
                    ),
                    const SizedBox(width: AppSpacing.xl),
                    Expanded(child: _right(context, stages)),
                  ],
                );
        },
      ),
    );
  }

  Widget _left(BuildContext context, List<String> stages) {
    final t = AppText.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(project.name, style: t.heading1),
        const SizedBox(height: AppSpacing.xs),
        Text(project.subtitle, style: t.monoBody),
        const SizedBox(height: AppSpacing.lg),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${(project.progress * 100).round()}',
              style: t.display2.copyWith(
                color: AppColors.accent,
                fontSize: 48,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 4),
              child: Text('%', style: t.monoBody),
            ),
            const SizedBox(width: AppSpacing.lg),
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                'PROGRESS',
                style: t.labelAccent,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        _ProgressBar(value: project.progress),
        const SizedBox(height: AppSpacing.lg),
        Text('CURRENT FOCUS', style: t.label),
        const SizedBox(height: AppSpacing.sm),
        ...project.focus.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: AppColors.accent,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(item, style: t.monoBody),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _right(BuildContext context, List<String> stages) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('STAGE', style: t.label),
        const SizedBox(height: AppSpacing.md),
        ...stages.asMap().entries.map((entry) {
          final i = entry.key;
          final active = i <= project.stage;
          final isCurrent = i == project.stage;
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Row(
              children: [
                Container(
                  width: isCurrent ? 12 : 8,
                  height: isCurrent ? 12 : 8,
                  decoration: BoxDecoration(
                    color: active
                        ? AppColors.accent
                        : Colors.transparent,
                    border: Border.all(
                      color: active
                          ? AppColors.accent
                          : (isDark
                              ? AppColors.darkLine
                              : AppColors.lightLine),
                      width: 1,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Text(
                    entry.value.toUpperCase(),
                    style: t.monoBody.copyWith(
                      color: active ? null : null,
                      letterSpacing: 1.4,
                      fontSize: 11,
                      fontWeight: isCurrent ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ),
                if (isCurrent)
                  Text('// now', style: t.labelAccent.copyWith(fontSize: 9)),
              ],
            ),
          );
        }),
      ],
    );
  }
}

/// Custom progress bar — a hairline, with a small "tip" marker.
class _ProgressBar extends StatelessWidget {
  final double value;
  const _ProgressBar({required this.value});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: value),
        duration: AppMotion.slow,
        curve: AppMotion.emphasized,
        builder: (context, v, _) {
          return LayoutBuilder(
            builder: (context, c) {
              return SizedBox(
                height: 6,
                child: Stack(
                  children: [
                    Container(
                      height: 1,
                      margin: const EdgeInsets.only(top: 2.5),
                      color: AppColors.accent.withValues(alpha: 0.15),
                    ),
                    Container(
                      width: c.maxWidth * v,
                      height: 1,
                      margin: const EdgeInsets.only(top: 2.5),
                      color: AppColors.accent,
                    ),
                    Positioned(
                      left: (c.maxWidth * v) - 3,
                      top: 0,
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: AppColors.accent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
