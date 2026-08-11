import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../animations/animations.dart';
import '../localization/app_strings.dart';
import '../localization/tech_labels.dart';
import '../theme/app_colors.dart';
import '../theme/design_system.dart';
import '../theme/typography.dart';
import '../../data/models/project.dart';
import 'buttons.dart';
import 'editorial_card.dart';
import 'image_preview_modal.dart';

class CaseStudyModal extends StatelessWidget {
  final Project project;

  const CaseStudyModal({super.key, required this.project});

  static Future<void> show(BuildContext context, Project project) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      barrierColor: Colors.black.withValues(alpha: 0.9),
      pageBuilder: (context, anim1, anim2) => CaseStudyModal(project: project),
      transitionDuration: AppMotion.base,
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(opacity: anim1, child: child);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.darkBackground : AppColors.lightBackground;

    return Scaffold(
      backgroundColor: bg,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _SliverHeader(project: project),
              SliverToBoxAdapter(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 920),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                        vertical: AppSpacing.xxl,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _OverviewSection(project: project),
                          const SizedBox(height: AppLayout.sectionGap / 2),
                          _ProblemSolutionRow(project: project),
                          const SizedBox(height: AppLayout.sectionGap / 2),
                          _RoleSection(project: project),
                          const SizedBox(height: AppLayout.sectionGap / 2),
                          _ArchitectureSection(project: project),
                          const SizedBox(height: AppLayout.sectionGap / 2),
                          if (project.aiIntegration != null) ...[
                            _AiSection(project: project),
                            const SizedBox(height: AppLayout.sectionGap / 2),
                          ],
                          if (project.security != null) ...[
                            _SecuritySection(project: project),
                            const SizedBox(height: AppLayout.sectionGap / 2),
                          ],
                          if (project.performance != null) ...[
                            _PerformanceSection(project: project),
                            const SizedBox(height: AppLayout.sectionGap / 2),
                          ],
                          _FeaturesGrid(project: project),
                          const SizedBox(height: AppLayout.sectionGap / 2),
                          _ChallengesSection(project: project),
                          const SizedBox(height: AppLayout.sectionGap / 2),
                          _GallerySection(project: project),
                          const SizedBox(height: AppLayout.sectionGap / 2),
                          _LinksFooter(project: project),
                          const SizedBox(height: AppSpacing.huge),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 20,
            right: 20,
            child: SafeArea(
              child: _CloseButton(onPressed: () => Navigator.of(context).pop()),
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverHeader extends StatelessWidget {
  final Project project;
  const _SliverHeader({required this.project});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return SliverAppBar(
      expandedHeight: 450,
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              project.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stack) => Container(
                color: AppColors.accentDim,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  color: AppColors.accent,
                  size: 40,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.2),
                    Colors.black.withValues(alpha: 0.95),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: AppSpacing.xl,
              left: AppSpacing.xl,
              right: AppSpacing.xl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.name.value,
                    style: t.display1.copyWith(
                      color: Colors.white,
                      fontSize: 56,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    project.description.value.toUpperCase(),
                    style: t.labelAccent.copyWith(
                      letterSpacing: 2.0,
                      color: AppColors.accent,
                    ),
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

class _OverviewSection extends StatelessWidget {
  final Project project;
  const _OverviewSection({required this.project});

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
      children: [
        _SectionLabel(label: AppStrings.caseStudyOverview),
        const SizedBox(height: AppSpacing.lg),
        Text(project.longDescription.value, style: t.bodyLg),
        const SizedBox(height: AppSpacing.xl),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: technologies
              .map((e) => TechChip(label: TechLabels.of(e)))
              .toList(),
        ),
      ],
    );
  }
}

class _ProblemSolutionRow extends StatelessWidget {
  final Project project;
  const _ProblemSolutionRow({required this.project});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return LayoutBuilder(
      builder: (context, c) {
        final stacked = c.maxWidth < 600;
        return Column(
          children: [
            if (stacked) ...[
              _buildProblem(t),
              const SizedBox(height: AppSpacing.xxl),
              _buildSolution(t),
            ] else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildProblem(t)),
                  const SizedBox(width: AppSpacing.xxl),
                  Expanded(child: _buildSolution(t)),
                ],
              ),
          ],
        );
      },
    );
  }

  Widget _buildProblem(AppTextStyles t) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _SectionLabel(label: AppStrings.caseStudyProblem),
      const SizedBox(height: AppSpacing.lg),
      Text(project.problem.value, style: t.bodyLg),
    ],
  );

  Widget _buildSolution(AppTextStyles t) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _SectionLabel(label: AppStrings.caseStudySolution),
      const SizedBox(height: AppSpacing.lg),
      Text(project.solution.value, style: t.bodyLg),
    ],
  );
}

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return Row(
      children: [
        Container(width: 16, height: 1, color: AppColors.accent),
        const SizedBox(width: AppSpacing.md),
        Text(label, style: t.labelAccent),
      ],
    );
  }
}

class _RoleSection extends StatelessWidget {
  final Project project;
  const _RoleSection({required this.project});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: AppStrings.caseStudyMyRole),
        const SizedBox(height: AppSpacing.lg),
        Text(project.role.value, style: t.heading1),
        const SizedBox(height: AppSpacing.md),
        Text(project.learnings.value, style: t.bodyLg),
      ],
    );
  }
}

class _ArchitectureSection extends StatelessWidget {
  final Project project;
  const _ArchitectureSection({required this.project});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: AppStrings.caseStudyArchitecture),
        const SizedBox(height: AppSpacing.lg),
        if (project.architectureDesc != null)
          Text(project.architectureDesc!.value, style: t.bodyLg),
        if (project.architectureDesc == null) ...[
          Text(AppStrings.archArchitectureDefault, style: t.bodyLg),
        ],
        const SizedBox(height: AppSpacing.xxl),
        const _ArchitectureVisualizer(),
      ],
    );
  }
}

class _ArchitectureVisualizer extends StatelessWidget {
  const _ArchitectureVisualizer();

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return EditorialCard(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Center(
        child: Column(
          children: [
            const Icon(
              Icons.account_tree_outlined,
              color: AppColors.accent,
              size: 32,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(AppStrings.archSystemMap, style: t.labelAccent),
            const SizedBox(height: AppSpacing.sm),
            Text(AppStrings.archInteractiveHint, style: t.monoBodySm),
          ],
        ),
      ),
    );
  }
}

class _AiSection extends StatelessWidget {
  final Project project;
  const _AiSection({required this.project});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: AppStrings.caseStudyAI),
        const SizedBox(height: AppSpacing.lg),
        Text(project.aiIntegration!.value, style: t.bodyLg),
      ],
    );
  }
}

class _SecuritySection extends StatelessWidget {
  final Project project;
  const _SecuritySection({required this.project});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: AppStrings.caseStudySecurity),
        const SizedBox(height: AppSpacing.lg),
        Text(project.security!.value, style: t.bodyLg),
      ],
    );
  }
}

class _PerformanceSection extends StatelessWidget {
  final Project project;
  const _PerformanceSection({required this.project});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: AppStrings.caseStudyPerformance),
        const SizedBox(height: AppSpacing.lg),
        Text(project.performance!.value, style: t.bodyLg),
      ],
    );
  }
}

class _FeaturesGrid extends StatelessWidget {
  final Project project;
  const _FeaturesGrid({required this.project});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final features = project.keyFeatures.value
        .split('\n')
        .where((s) => s.trim().isNotEmpty)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: AppStrings.caseStudyFeatures),
        const SizedBox(height: AppSpacing.lg),
        LayoutBuilder(
          builder: (context, c) {
            final cols = c.maxWidth > 700 ? 2 : 1;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: cols,
                mainAxisExtent: 80,
                crossAxisSpacing: AppSpacing.lg,
                mainAxisSpacing: AppSpacing.lg,
              ),
              itemCount: features.length,
              itemBuilder: (context, i) {
                return EditorialCard(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: AppColors.accent,
                        size: 16,
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Text(
                          features[i].replaceAll('•', '').trim(),
                          style: t.monoBodySm,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class _ChallengesSection extends StatelessWidget {
  final Project project;
  const _ChallengesSection({required this.project});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: AppStrings.caseStudyChallenges),
        const SizedBox(height: AppSpacing.lg),
        Text(project.challenges.value, style: t.bodyLg),
      ],
    );
  }
}

class _GallerySection extends StatelessWidget {
  final Project project;
  const _GallerySection({required this.project});

  @override
  Widget build(BuildContext context) {
    if (project.galleryImages == null || project.galleryImages!.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: AppStrings.caseStudyScreens),
        const SizedBox(height: AppSpacing.xl),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: project.galleryImages!.length,
          separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.xxl),
          itemBuilder: (context, i) {
            final path = project.galleryImages![i];
            return RevealOnScroll(
              delay: Duration(milliseconds: 100 * (i % 3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        AppStrings.useCaseLabel.replaceAll(
                          '{n}',
                          (i + 1).toString().padLeft(2, '0'),
                        ),
                        style: AppText.of(
                          context,
                        ).labelAccent.copyWith(fontSize: 10),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: AppColors.accent.withValues(alpha: 0.2),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  GestureDetector(
                    onTap: () => ImagePreviewModal.show(
                      context: context,
                      imageUrl: path,
                      title: AppStrings.screenLabel.replaceAll(
                        '{n}',
                        (i + 1).toString(),
                      ),
                    ),
                    child: EditorialCard(
                      padding: EdgeInsets.zero,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppRadius.sm),
                        child: Image.asset(
                          path,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stack) => Container(
                            height: 200,
                            color: AppColors.accentDim,
                            alignment: Alignment.center,
                            child: const Icon(
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
            );
          },
        ),
      ],
    );
  }
}

class _LinksFooter extends StatelessWidget {
  final Project project;
  const _LinksFooter({required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SectionLabel(label: AppStrings.caseStudyLinks),
        const SizedBox(height: AppSpacing.lg),
        Row(
          children: [
            if (project.githubUrl != null)
              Expanded(
                child: AppButton(
                  label: AppStrings.githubLabel,
                  kind: ButtonKind.secondary,
                  onPressed: () => _launch(project.githubUrl!),
                ),
              ),
            if (project.githubUrl != null && project.demoUrl != null)
              const SizedBox(width: AppSpacing.md),
            if (project.demoUrl != null)
              Expanded(
                child: AppButton(
                  label: AppStrings.liveDemoLabel,
                  onPressed: () => _launch(project.demoUrl!),
                  showArrow: true,
                ),
              ),
          ],
        ),
      ],
    );
  }

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }
}

class _CloseButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _CloseButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      mouseCursor: SystemMouseCursors.click,
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) => onPressed(),
        ),
      },
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.6),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white24, width: 1),
          ),
          child: const Icon(Icons.close_rounded, color: Colors.white, size: 24),
        ),
      ),
    );
  }
}
