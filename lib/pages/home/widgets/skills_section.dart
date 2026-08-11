import 'package:flutter/material.dart';
import '../../../core/animations/animations.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/localization/tech_labels.dart';
import '../../../core/theme/design_system.dart';
import '../../../core/theme/typography.dart';
import '../../../core/widgets/editorial_card.dart';
import '../../../core/widgets/ui_primitives.dart';
import '../../../data/models/skill.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = SkillData.categories;
    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            label: AppStrings.sectionSkills,
            title: AppStrings.skillsHeadline,
            subtitle: AppStrings.skillsSub,
          ),
          const SizedBox(height: AppSpacing.xxl),
          LayoutBuilder(
            builder: (context, c) {
              final columns = c.maxWidth >= 1100
                  ? 3
                  : c.maxWidth >= 760
                  ? 2
                  : 1;
              return Wrap(
                spacing: AppSpacing.lg,
                runSpacing: AppSpacing.lg,
                children: categories.asMap().entries.map((entry) {
                  final i = entry.key;
                  final cat = entry.value;
                  final width = columns == 1
                      ? c.maxWidth
                      : (c.maxWidth - AppSpacing.lg * (columns - 1)) / columns;
                  return SizedBox(
                    width: width,
                    child: RevealOnScroll(
                      delay: Duration(milliseconds: 80 * i),
                      child: _SkillGroup(category: cat),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SkillGroup extends StatelessWidget {
  final SkillCategory category;
  const _SkillGroup({required this.category});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return EditorialCard(
      number: category.number,
      tag: category.name.toUpperCase(),
      onTap: () {}, // Make card interactive
      semanticLabel: category.name,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(category.name, style: t.heading2),
          if (category.description.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(category.description, style: t.bodySm),
          ],
          const SizedBox(height: AppSpacing.lg),
          const Hairline(),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: category.skills
                .map<Widget>(
                  (skill) => TechChip(label: TechLabels.of(skill), dense: true),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
