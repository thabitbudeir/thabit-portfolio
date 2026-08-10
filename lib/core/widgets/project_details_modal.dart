import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_colors.dart';
import '../theme/design_system.dart';
import '../theme/typography.dart';
import 'buttons.dart';
import 'editorial_card.dart';

class ProjectDetailsModal extends StatelessWidget {
  final String title;
  final String description;
  final String? problem;
  final String? solution;
  final String? role;
  final List<String> technologies;
  final List<String>? features;
  final String? githubUrl;
  final String? demoUrl;
  final String imageUrl;

  const ProjectDetailsModal({
    super.key,
    required this.title,
    required this.description,
    this.problem,
    this.solution,
    this.role,
    required this.technologies,
    this.features,
    this.githubUrl,
    this.demoUrl,
    required this.imageUrl,
  });

  static Future<void> show({
    required BuildContext context,
    required String title,
    required String description,
    String? problem,
    String? solution,
    String? role,
    required List<String> technologies,
    List<String>? features,
    String? githubUrl,
    String? demoUrl,
    required String imageUrl,
  }) {
    return showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.7),
      builder: (context) => ProjectDetailsModal(
        title: title,
        description: description,
        problem: problem,
        solution: solution,
        role: role,
        technologies: technologies,
        features: features,
        githubUrl: githubUrl,
        demoUrl: demoUrl,
        imageUrl: imageUrl,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final line = isDark ? AppColors.darkLine : AppColors.lightLine;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(AppSpacing.lg),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 920, maxHeight: 720),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
          border: Border.all(color: line, width: 1),
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ModalHeader(
              title: title,
              onClose: () => Navigator.of(context).pop(),
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ProjectImage(imageUrl: imageUrl),
                    const SizedBox(height: AppSpacing.xl),
                    _Section(
                      title: 'OVERVIEW',
                      child: Text(description, style: t.bodyLg),
                    ),
                    if (problem != null) ...[
                      const SizedBox(height: AppSpacing.xl),
                      _Section(
                        title: 'PROBLEM',
                        child: Text(problem!, style: t.bodyLg),
                      ),
                    ],
                    if (solution != null) ...[
                      const SizedBox(height: AppSpacing.xl),
                      _Section(
                        title: 'SOLUTION',
                        child: Text(solution!, style: t.bodyLg),
                      ),
                    ],
                    if (role != null) ...[
                      const SizedBox(height: AppSpacing.xl),
                      _Section(
                        title: 'MY ROLE',
                        child: Text(role!, style: t.bodyLg),
                      ),
                    ],
                    const SizedBox(height: AppSpacing.xl),
                    _Section(
                      title: 'TECH STACK',
                      child: Wrap(
                        spacing: AppSpacing.sm,
                        runSpacing: AppSpacing.sm,
                        children:
                            technologies.map((tech) => TechChip(label: tech)).toList(),
                      ),
                    ),
                    if (features != null && features!.isNotEmpty) ...[
                      const SizedBox(height: AppSpacing.xl),
                      _Section(
                        title: 'KEY FEATURES',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: features!.map((feature) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  bottom: AppSpacing.sm),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Container(
                                      width: 4,
                                      height: 4,
                                      decoration: const BoxDecoration(
                                        color: AppColors.accent,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: AppSpacing.md),
                                  Expanded(
                                    child: Text(feature, style: t.body),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                    const SizedBox(height: AppSpacing.xl),
                    Row(
                      children: [
                        if (githubUrl != null) ...[
                          Expanded(
                            child: AppButton(
                              label: 'GITHUB',
                              kind: ButtonKind.secondary,
                              onPressed: () => _launchURL(githubUrl!),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.md),
                        ],
                        if (demoUrl != null)
                          Expanded(
                            child: AppButton(
                              label: 'LIVE DEMO',
                              kind: ButtonKind.primary,
                              showArrow: true,
                              onPressed: () => _launchURL(demoUrl!),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

class _ModalHeader extends StatelessWidget {
  final String title;
  final VoidCallback onClose;
  const _ModalHeader({required this.title, required this.onClose});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final line = isDark ? AppColors.darkLine : AppColors.lightLine;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.lg,
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: line, width: 1)),
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppColors.accent,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              title,
              style: t.heading2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: onClose,
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Icon(
                Icons.close_rounded,
                size: 18,
                color: isDark ? AppColors.darkInk : AppColors.lightInk,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectImage extends StatelessWidget {
  final String imageUrl;
  const _ProjectImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.sm),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          cacheWidth: 1200,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: AppColors.accentDim,
              alignment: Alignment.center,
              child: const Icon(
                Icons.image_outlined,
                size: 48,
                color: AppColors.accent,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final Widget child;
  const _Section({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.accent, width: 1),
            ),
          ),
          child: Text(title, style: t.labelAccent),
        ),
        const SizedBox(height: AppSpacing.md),
        child,
      ],
    );
  }
}
