import 'package:flutter/material.dart';
import '../../../core/animations/animations.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/design_system.dart';
import '../../../core/theme/typography.dart';
import '../../../core/widgets/editorial_card.dart';
import '../../../core/widgets/ui_primitives.dart';
import '../../../data/models/experience.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final experience = ExperienceData.experience;
    final education = ExperienceData.education;
    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            label: AppStrings.sectionExperience,
            title: AppStrings.get(
                'Trajectory.',
                'المسار المهني.',
                'Werdegang.'),
            subtitle: AppStrings.get(
              'Where I have been, what I have been doing, and what it has built.',
              'أين كنت، ماذا فعلت، وما الذي بنيناه.',
              'Wo ich war, was ich getan habe und was es aufgebaut hat.',
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          RevealOnScroll(
            child: Column(
              children: [
                _TimelineBlock(
                  tag: 'WORK',
                  title: AppStrings.get('Experience', 'الخبرة', 'Erfahrung'),
                  items: experience
                      .map((e) => _TimelineData(
                            date: e.period,
                            role: e.title,
                            org: e.organization,
                            description: e.description ?? '',
                          ))
                      .toList(),
                ),
                const SizedBox(height: AppSpacing.xl),
                _TimelineBlock(
                  tag: 'EDU',
                  title: AppStrings.get('Education', 'التعليم', 'Ausbildung'),
                  items: education
                      .map((e) => _TimelineData(
                            date: e.period,
                            role: e.degree,
                            org: e.institution,
                            description: e.specialization ?? '',
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineData {
  final String date;
  final String role;
  final String org;
  final String description;
  _TimelineData({
    required this.date,
    required this.role,
    required this.org,
    required this.description,
  });
}

class _TimelineBlock extends StatelessWidget {
  final String title;
  final List<_TimelineData> items;
  final String tag;
  const _TimelineBlock({
    required this.title,
    required this.items,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final line = isDark ? AppColors.darkLine : AppColors.lightLine;
    return EditorialCard(
      tag: tag,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: t.heading1),
          const SizedBox(height: AppSpacing.lg),
          Hairline(),
          const SizedBox(height: AppSpacing.lg),
          if (items.isEmpty)
            Text('// coming soon', style: t.labelAccent)
          else
            ...items.asMap().entries.map((entry) {
              final idx = entry.key;
              final item = entry.value;
              final last = idx == items.length - 1;
              return Padding(
                padding: EdgeInsets.only(bottom: last ? 0 : AppSpacing.lg),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: AppColors.accent,
                              shape: BoxShape.circle,
                            ),
                          ),
                          if (!last)
                            Expanded(
                              child: Container(
                                width: 1,
                                color: line,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: AppSpacing.md),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.date, style: t.labelAccent),
                              const SizedBox(height: AppSpacing.xs),
                              Text(item.role, style: t.heading3),
                              Text(item.org, style: t.monoBody),
                              if (item.description.isNotEmpty) ...[
                                const SizedBox(height: AppSpacing.sm),
                                Text(item.description, style: t.body),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
        ],
      ),
    );
  }
}
