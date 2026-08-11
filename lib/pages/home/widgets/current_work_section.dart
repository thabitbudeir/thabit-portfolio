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
        name: AppStrings.currentNameAurix,
        subtitle: AppStrings.get(
          'Smart Tender Management System',
          'نظام ذكي لإدارة المناقصات',
          'Intelligentes Ausschreibungsmanagementsystem',
        ),
        progress: 0.75,
        status: AppStrings.statusInDev,
        focus: [
          AppStrings.get(
            'AI Document Verification',
            'التحقق من المستندات بالذكاء الاصطناعي',
            'KI-Dokumentenprüfung',
          ),
          AppStrings.get(
            'Decision Engine',
            'محرك اتخاذ القرار',
            'Entscheidungs-Engine',
          ),
          AppStrings.get(
            'Dashboard Polish',
            'تحسين لوحة التحكم',
            'Dashboard-Optimierung',
          ),
        ],
        stage: 2,
      ),
    ];

    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            label: AppStrings.sectionCurrent,
            title: AppStrings.currentHeadline,
            subtitle: AppStrings.currentSub,
          ),
          const SizedBox(height: AppSpacing.xxl),
          LayoutBuilder(
            builder: (context, c) {
              final isDesktop = c.maxWidth > 800;
              return isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 4, child: _CurrentlySummary()),
                        const SizedBox(width: AppSpacing.xl),
                        Expanded(flex: 6, child: _buildProjects(projects)),
                      ],
                    )
                  : Column(
                      children: [
                        _CurrentlySummary(),
                        const SizedBox(height: AppSpacing.xl),
                        _buildProjects(projects),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjects(List<_CurrentProject> projects) {
    return Column(
      children: projects.asMap().entries.map((entry) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: entry.key == projects.length - 1 ? 0 : AppSpacing.lg,
          ),
          child: RevealOnScroll(
            delay: Duration(milliseconds: 120 * entry.key),
            child: _CurrentWorkCard(project: entry.value),
          ),
        );
      }).toList(),
    );
  }
}

class _CurrentlySummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EditorialCard(
      number: 'CURRENTLY',
      tag: AppStrings.currentChipStatus,
      onTap: () {}, // Make card interactive
      semanticLabel: 'Current Professional Status',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItem(
            context,
            AppStrings.buildingLabel,
            AppStrings.currentBuildingValue,
          ),
          const SizedBox(height: AppSpacing.md),
          _buildItem(
            context,
            AppStrings.learningLabel,
            AppStrings.currentLearningValue,
          ),
          const SizedBox(height: AppSpacing.md),
          _buildItem(
            context,
            AppStrings.exploringLabel,
            AppStrings.currentExploringValue,
          ),
          const SizedBox(height: AppSpacing.md),
          _buildItem(
            context,
            AppStrings.availableForLabel,
            AppStrings.currentAvailableValue,
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, String label, String value) {
    final t = AppText.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: AppColors.accent,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(label, style: t.labelAccent.copyWith(fontSize: 10)),
          ],
        ),
        const SizedBox(height: 4),
        Padding(
          padding: EdgeInsets.only(
            left: AppStrings.isRTL ? 0 : 14,
            right: AppStrings.isRTL ? 14 : 0,
          ),
          child: Text(value, style: t.monoBody.copyWith(fontSize: 13)),
        ),
      ],
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
      AppStrings.stagePlanning,
      AppStrings.stageDesign,
      AppStrings.stageDevelopment,
      AppStrings.stageTesting,
      AppStrings.stageDeployment,
    ];
    return EditorialCard(
      number: 'NOW',
      tag: project.status,
      onTap: () {}, // Make card interactive
      padding: const EdgeInsets.all(AppSpacing.xl),
      semanticLabel: 'Project in development: ${project.name}',
      child: LayoutBuilder(
        builder: (context, c) {
          final stacked = c.maxWidth < 500;
          return stacked
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _left(context, stages),
                    const SizedBox(height: AppSpacing.xl),
                    const Hairline(),
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
                      height: 180,
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
        Text(project.subtitle, style: t.monoBody.copyWith(fontSize: 11)),
        const SizedBox(height: AppSpacing.lg),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${(project.progress * 100).round()}',
              style: t.display2.copyWith(color: AppColors.accent, fontSize: 40),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6, left: 4),
              child: Text('%', style: t.monoBody),
            ),
            const SizedBox(width: AppSpacing.md),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                AppStrings.progressLabel.toUpperCase(),
                style: t.labelAccent.copyWith(fontSize: 9),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        _ProgressBar(value: project.progress),
        const SizedBox(height: AppSpacing.lg),
        Text(
          AppStrings.currentFocus.toUpperCase(),
          style: t.label.copyWith(fontSize: 9),
        ),
        const SizedBox(height: AppSpacing.sm),
        ...project.focus.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                Container(
                  width: 3,
                  height: 3,
                  decoration: const BoxDecoration(
                    color: AppColors.accent,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(item, style: t.monoBody.copyWith(fontSize: 10)),
                ),
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
        Text(AppStrings.stageLabel, style: t.label.copyWith(fontSize: 9)),
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
                  width: isCurrent ? 10 : 6,
                  height: isCurrent ? 10 : 6,
                  decoration: BoxDecoration(
                    color: active ? AppColors.accent : Colors.transparent,
                    border: Border.all(
                      color: active
                          ? AppColors.accent
                          : (isDark ? AppColors.darkLine : AppColors.lightLine),
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
                      color: active
                          ? null
                          : (isDark
                                ? AppColors.darkInkMute
                                : AppColors.lightInkMute),
                      letterSpacing: 1.2,
                      fontSize: 10,
                      fontWeight: isCurrent ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ),
                if (isCurrent)
                  Text(
                    AppStrings.nowLabel,
                    style: t.labelAccent.copyWith(fontSize: 8),
                  ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

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
                height: 4,
                child: Stack(
                  children: [
                    Container(
                      height: 1,
                      margin: const EdgeInsets.only(top: 1.5),
                      color: AppColors.accent.withValues(alpha: 0.15),
                    ),
                    Container(
                      width: c.maxWidth * v,
                      height: 1,
                      margin: const EdgeInsets.only(top: 1.5),
                      color: AppColors.accent,
                    ),
                    Positioned(
                      left: (c.maxWidth * v) - 2,
                      top: 0,
                      child: Container(
                        width: 4,
                        height: 4,
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
