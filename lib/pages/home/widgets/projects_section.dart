import 'package:flutter/material.dart';
import '../../../core/animations/animations.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/localization/tech_labels.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/design_system.dart';
import '../../../core/theme/typography.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/case_study_modal.dart';
import '../../../core/widgets/editorial_card.dart';
import '../../../core/widgets/ui_primitives.dart';
import '../../../data/models/project.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = ProjectData.projects;
    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            label: AppStrings.sectionProjects,
            title: AppStrings.projectsHeadline,
            subtitle: AppStrings.projectsSub,
          ),
          const SizedBox(height: AppSpacing.xxl),
          ...projects.asMap().entries.map((entry) {
            final i = entry.key;
            final p = entry.value;
            // First project is featured
            final isFeatured = i == 0;
            return Padding(
              padding: EdgeInsets.only(
                bottom: i == projects.length - 1 ? 0 : AppSpacing.xxl,
              ),
              child: RevealOnScroll(
                delay: Duration(milliseconds: 100 * i),
                child: isFeatured
                    ? _FeaturedProjectEntry(project: p)
                    : _ProjectEntry(project: p, index: i, isReverse: i.isOdd),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _FeaturedProjectEntry extends StatelessWidget {
  final Project project;
  const _FeaturedProjectEntry({required this.project});

  @override
  Widget build(BuildContext context) {
    return EditorialCard(
      tag: AppStrings.featuredLabel,
      number: project.number,
      overrideBorder: AppColors.accent,
      onTap: () => CaseStudyModal.show(context, project),
      semanticLabel: '${AppStrings.featuredLabel}: ${project.name.value}',
      child: LayoutBuilder(
        builder: (context, c) {
          final stacked = c.maxWidth < 920;
          final media = _ProjectMedia(
            imageUrl: project.imageUrl,
            name: project.name.value,
            onTap: () => CaseStudyModal.show(context, project),
          );
          final body = _ProjectBody(project: project, number: project.number);

          if (stacked) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.md),
                media,
                const SizedBox(height: AppSpacing.xl),
                body,
              ],
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.md),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 5, child: body),
                  const SizedBox(width: AppSpacing.xxl),
                  Expanded(flex: 4, child: media),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ProjectEntry extends StatelessWidget {
  final Project project;
  final int index;
  final bool isReverse;

  const _ProjectEntry({
    required this.project,
    required this.index,
    required this.isReverse,
  });

  @override
  Widget build(BuildContext context) {
    final number = project.number;

    return EditorialCard(
      number: number,
      onTap: () => CaseStudyModal.show(context, project),
      semanticLabel: '${AppStrings.projectLabel}: ${project.name.value}',
      child: LayoutBuilder(
        builder: (context, c) {
          final stacked = c.maxWidth < 920;

          final media = _ProjectMedia(
            imageUrl: project.imageUrl,
            name: project.name.value,
            onTap: () => CaseStudyModal.show(context, project),
          );
          final body = _ProjectBody(project: project, number: number);

          if (stacked) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                media,
                const SizedBox(height: AppSpacing.xl),
                body,
              ],
            );
          }

          final children = isReverse
              ? [
                  Expanded(child: body),
                  const SizedBox(width: AppSpacing.xxl),
                  Expanded(child: media),
                ]
              : [
                  Expanded(child: media),
                  const SizedBox(width: AppSpacing.xxl),
                  Expanded(child: body),
                ];

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          );
        },
      ),
    );
  }
}

class _ProjectMedia extends StatefulWidget {
  final String imageUrl;
  final String name;
  final VoidCallback onTap;
  const _ProjectMedia({
    required this.imageUrl,
    required this.name,
    required this.onTap,
  });

  @override
  State<_ProjectMedia> createState() => _ProjectMediaState();
}

class _ProjectMediaState extends State<_ProjectMedia> {
  bool _hovered = false;
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final active = _hovered || _focused;

    return FocusableActionDetector(
      onShowFocusHighlight: (v) => setState(() => _focused = v),
      onShowHoverHighlight: (v) => setState(() => _hovered = v),
      mouseCursor: SystemMouseCursors.click,
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) => widget.onTap(),
        ),
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AspectRatio(
          aspectRatio: 16 / 10,
          child: AnimatedContainer(
            duration: AppMotion.base,
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
              border: Border.all(
                color: active
                    ? AppColors.accent.withValues(alpha: 0.8)
                    : (isDark ? AppColors.darkLine : AppColors.lightLine),
                width: _focused ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                    child: AnimatedScale(
                      scale: active ? 1.02 : 1.0,
                      duration: AppMotion.slow,
                      curve: AppMotion.standard,
                      child: Image.asset(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                        cacheWidth: 1200,
                        errorBuilder: (context, error, stack) => Container(
                          color: AppColors.accentDim,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            color: AppColors.accent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProjectBody extends StatelessWidget {
  final Project project;
  final String number;
  const _ProjectBody({required this.project, required this.number});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final technologies = project.technologies
        .split('·')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(number, style: t.labelAccent),
            const SizedBox(width: AppSpacing.md),
            Container(width: 16, height: 1, color: AppColors.accent),
            const SizedBox(width: AppSpacing.md),
            Text(AppStrings.projectLabel, style: t.label),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(project.name.value, style: t.display3.copyWith(fontSize: 32)),
        const SizedBox(height: AppSpacing.md),
        Text(project.description.value, style: t.bodyLg),
        const SizedBox(height: AppSpacing.lg),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: technologies
              .map<Widget>(
                (tech) => TechChip(label: TechLabels.of(tech), dense: true),
              )
              .toList(),
        ),
        const SizedBox(height: AppSpacing.xl),
        AppButton(
          label: AppStrings.viewCaseStudy,
          onPressed: () => CaseStudyModal.show(context, project),
          showArrow: true,
        ),
      ],
    );
  }
}
