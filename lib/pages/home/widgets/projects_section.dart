import 'package:flutter/material.dart';
import '../../../core/animations/animations.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/design_system.dart';
import '../../../core/theme/typography.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/editorial_card.dart';
import '../../../core/widgets/project_details_modal.dart';
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
            title: AppStrings.get('Selected projects.',
                'مشاريع مختارة.', 'Ausgewählte Projekte.'),
            subtitle: AppStrings.get(
              'Real products, real problems, real systems. Each entry below is a product-shaped body of work, not a screenshot.',
              'منتجات حقيقية، مشاكل حقيقية، أنظمة حقيقية. كل عنصر هنا هو عمل بمنتج متكامل، وليس لقطة شاشة.',
              'Echte Produkte, echte Probleme, echte Systeme. Jeder Eintrag ist produktförmige Arbeit, kein Screenshot.',
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          ...projects.asMap().entries.map((entry) {
            final i = entry.key;
            final p = entry.value;
            final isFeatured = i == 0;
            return Padding(
              padding: EdgeInsets.only(
                bottom: i == projects.length - 1 ? 0 : AppSpacing.xxl,
              ),
              child: RevealOnScroll(
                delay: Duration(milliseconds: 100 * i),
                child: isFeatured
                    ? _FeaturedProjectEntry(project: p)
                    : _ProjectEntry(
                        project: p,
                        index: i,
                        isReverse: i.isOdd,
                      ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

/// Featured project — full-width product spotlight with accent edge.
class _FeaturedProjectEntry extends StatelessWidget {
  final Project project;
  const _FeaturedProjectEntry({required this.project});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final line = isDark ? AppColors.darkLine : AppColors.lightLine;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        border: Border(
          left: const BorderSide(color: AppColors.accent, width: 2),
          top: BorderSide(color: line, width: 1),
          right: BorderSide(color: line, width: 1),
          bottom: BorderSide(color: line, width: 1),
        ),
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: LayoutBuilder(
        builder: (context, c) {
          final stacked = c.maxWidth < 920;
          final media = _ProjectMedia(
            imageUrl: project.imageUrl,
            name: project.name,
          );
          final body = _ProjectBody(project: project, number: '01');

          if (stacked) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('FEATURED', style: t.labelAccent),
                    const SizedBox(width: AppSpacing.md),
                    Container(width: 32, height: 1, color: AppColors.accent),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                media,
                const SizedBox(height: AppSpacing.xl),
                body,
              ],
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('FEATURED', style: t.labelAccent),
                  const SizedBox(width: AppSpacing.md),
                  Container(width: 32, height: 1, color: AppColors.accent),
                  const Spacer(),
                  Text(project.number, style: t.label),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),
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
    return LayoutBuilder(
      builder: (context, c) {
        final stacked = c.maxWidth < 920;
        final number = (index + 1).toString().padLeft(2, '0');

        final media = _ProjectMedia(
          imageUrl: project.imageUrl,
          name: project.name,
        );
        final body = _ProjectBody(project: project, number: number);

        final children = stacked
            ? [media, const SizedBox(height: AppSpacing.xl), body]
            : isReverse
                ? [Expanded(child: body), const SizedBox(width: AppSpacing.xxl), Expanded(child: media)]
                : [Expanded(child: media), const SizedBox(width: AppSpacing.xxl), Expanded(child: body)];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ],
        );
      },
    );
  }
}

class _ProjectMedia extends StatefulWidget {
  final String imageUrl;
  final String name;
  const _ProjectMedia({required this.imageUrl, required this.name});

  @override
  State<_ProjectMedia> createState() => _ProjectMediaState();
}

class _ProjectMediaState extends State<_ProjectMedia> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
            border: Border.all(
              color: _hovered
                  ? AppColors.accent.withValues(alpha: 0.5)
                  : (isDark ? AppColors.darkLine : AppColors.lightLine),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  child: AnimatedScale(
                    scale: _hovered ? 1.02 : 1.0,
                    duration: AppMotion.slow,
                    curve: AppMotion.standard,
                    child: Image.asset(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                      cacheWidth: 1200,
                      errorBuilder: (context, error, stack) {
                        return Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColors.accent.withValues(alpha: 0.12),
                                Colors.transparent,
                              ],
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'PROJECT.IMAGE',
                            style: t.labelAccent.copyWith(letterSpacing: 2.4),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              // Corner brackets — technical-document vibe
              Positioned(
                top: AppSpacing.md,
                left: AppSpacing.md,
                child: _CornerBracket(isTopLeft: true, hovered: _hovered),
              ),
              Positioned(
                top: AppSpacing.md,
                right: AppSpacing.md,
                child: _CornerBracket(isTopLeft: false, hovered: _hovered),
              ),
              Positioned(
                bottom: AppSpacing.md,
                left: AppSpacing.md,
                child: _CornerBracket(
                    isTopLeft: true, hovered: _hovered, rotate: 3),
              ),
              Positioned(
                bottom: AppSpacing.md,
                right: AppSpacing.md,
                child: _CornerBracket(
                    isTopLeft: false, hovered: _hovered, rotate: 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CornerBracket extends StatelessWidget {
  final bool isTopLeft;
  final bool hovered;
  final int rotate;
  const _CornerBracket({
    required this.isTopLeft,
    required this.hovered,
    this.rotate = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 12,
      height: 12,
      child: CustomPaint(
        painter: _BracketPainter(
          color: hovered ? AppColors.accent : Colors.white.withValues(alpha: 0.7),
          flipX: !isTopLeft,
          flipY: rotate.isOdd,
        ),
      ),
    );
  }
}

class _BracketPainter extends CustomPainter {
  final Color color;
  final bool flipX;
  final bool flipY;
  _BracketPainter({
    required this.color,
    required this.flipX,
    required this.flipY,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.square;
    final w = size.width;
    final h = size.height;
    final l = flipX ? w : 0.0;
    final t = flipY ? h : 0.0;
    final path = Path()
      ..moveTo(l, t + h / 2)
      ..lineTo(l, t)
      ..lineTo(l + (flipX ? -w : w) / 2, t);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _BracketPainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.flipX != flipX ||
      oldDelegate.flipY != flipY;
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
        // 01 / AURIX — the "this is project number X" voice
        Row(
          children: [
            Text(number, style: t.labelAccent),
            const SizedBox(width: AppSpacing.md),
            Container(width: 16, height: 1, color: AppColors.accent),
            const SizedBox(width: AppSpacing.md),
            Text('PROJECT', style: t.label),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(project.name, style: t.display3.copyWith(fontSize: 36)),
        const SizedBox(height: AppSpacing.md),
        Text(project.description, style: t.bodyLg),
        const SizedBox(height: AppSpacing.lg),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: technologies
              .map((tech) => TechChip(label: tech, dense: true))
              .toList(),
        ),
        const SizedBox(height: AppSpacing.lg),
        if (project.role.isNotEmpty)
          Text(
            '${AppStrings.get("Role", "الدور", "Rolle")}  →  ${project.role}',
            style: t.monoBodySm,
          ),
        const SizedBox(height: AppSpacing.xl),
        AppButton(
          label: AppStrings.viewProject,
          kind: ButtonKind.ghost,
          showArrow: true,
          onPressed: () => _open(context),
        ),
      ],
    );
  }

  void _open(BuildContext context) {
    ProjectDetailsModal.show(
      context: context,
      title: project.name,
      description: project.longDescription,
      problem: project.problem,
      solution: project.solution,
      role: project.role,
      technologies: project.technologies
          .split('·')
          .map((e) => e.trim())
          .toList(),
      features: project.keyFeatures.split('\n'),
      githubUrl: project.githubUrl,
      demoUrl: project.demoUrl,
      imageUrl: project.imageUrl,
    );
  }
}
