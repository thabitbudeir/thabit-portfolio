import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../localization/app_strings.dart';
import '../theme/app_colors.dart';
import '../theme/design_system.dart';
import '../theme/typography.dart';
import '../../data/models/project.dart';
import 'buttons.dart';
import 'ui_primitives.dart';
import 'editorial_card.dart';

class CaseStudyModal extends StatelessWidget {
  final Project project;

  const CaseStudyModal({super.key, required this.project});

  static Future<void> show(BuildContext context, Project project) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      barrierColor: Colors.black.withValues(alpha: 0.85),
      pageBuilder: (context, anim1, anim2) => CaseStudyModal(project: project),
      transitionDuration: AppMotion.base,
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.98, end: 1.0).animate(
              CurvedAnimation(parent: anim1, curve: AppMotion.standard),
            ),
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
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
                          _FeaturesGrid(project: project),
                          const SizedBox(height: AppLayout.sectionGap / 2),
                          _ChallengesSection(project: project),
                          if (project.aiIntegration != null) ...[
                            const SizedBox(height: AppLayout.sectionGap / 2),
                            _AISection(project: project),
                          ],
                          const SizedBox(height: AppLayout.sectionGap / 2),
                          _TechnicalDetailsRow(project: project),
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
      expandedHeight: 400,
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
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.1),
                    Colors.black.withValues(alpha: 0.9),
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
                    project.name,
                    style: t.display1.copyWith(color: Colors.white, fontSize: 56),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    project.description.toUpperCase(),
                    style: t.labelAccent.copyWith(letterSpacing: 2.0, color: AppColors.accent),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: AppStrings.caseStudyOverview),
        const SizedBox(height: AppSpacing.lg),
        Text(project.longDescription, style: t.bodyLg),
        const SizedBox(height: AppSpacing.xl),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: project.technologies
              .split('·')
              .map((e) => TechChip(label: e.trim()))
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
      Text(project.problem, style: t.bodyLg),
    ],
  );

  Widget _buildSolution(AppTextStyles t) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _SectionLabel(label: AppStrings.caseStudySolution),
      const SizedBox(height: AppSpacing.lg),
      Text(project.solution, style: t.bodyLg),
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
        Text(project.role, style: t.heading1),
        const SizedBox(height: AppSpacing.md),
        Text(project.learnings, style: t.bodyLg),
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
          Text(project.architectureDesc!, style: t.bodyLg),
        const SizedBox(height: AppSpacing.xxl),
        const _ArchitectureVisualizer(),
      ],
    );
  }
}

class _ArchitectureVisualizer extends StatefulWidget {
  const _ArchitectureVisualizer();

  @override
  State<_ArchitectureVisualizer> createState() => _ArchitectureVisualizerState();
}

class _ArchitectureVisualizerState extends State<_ArchitectureVisualizer> {
  String? _selectedId;

  final List<_ArchNode> _nodes = [
    _ArchNode('Flutter', 'Client', 0.2, 0.3),
    _ArchNode('Laravel', 'Backend', 0.8, 0.3),
    _ArchNode('GetX', 'State', 0.2, 0.6),
    _ArchNode('PostgreSQL', 'Data', 0.8, 0.6),
    _ArchNode('Firebase', 'Sync', 0.1, 0.85),
    _ArchNode('AI Engine', 'Logic', 0.4, 0.85),
  ];

  final Map<String, String> _descriptions = {
    'Flutter': 'Mobile Client application built with Dart for high performance and consistent UI.',
    'GetX': 'Reactive state management and dependency injection system.',
    'Laravel': 'PHP Framework providing a robust RESTful API layer and business logic.',
    'PostgreSQL': 'Relational database used for structured data and tender records.',
    'AI Engine': 'Uses MCDM algorithms to evaluate and rank tender criteria objectively.',
    'Firebase': 'Handles real-time push notifications and document sync triggers.',
  };

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return Column(
      children: [
        EditorialCard(
          padding: EdgeInsets.zero,
          child: Container(
            height: 320,
            width: double.infinity,
            child: LayoutBuilder(
              builder: (context, c) {
                return Stack(
                  children: [
                    CustomPaint(
                      size: Size(c.maxWidth, 320),
                      painter: _ArchPainter(nodes: _nodes, selectedId: _selectedId),
                    ),
                    ..._nodes.map((n) => _buildNode(n, c)),
                  ],
                );
              },
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        AnimatedSwitcher(
          duration: AppMotion.fast,
          child: Container(
            key: ValueKey(_selectedId),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
            child: Column(
              children: [
                Text(
                  _selectedId?.toUpperCase() ?? 'INTERACTIVE SYSTEM MAP',
                  style: t.labelAccent,
                ),
                const SizedBox(height: 4),
                Text(
                  _selectedId == null 
                    ? 'Tap a component to explore technical details' 
                    : (_descriptions[_selectedId] ?? ''),
                  style: t.monoBody,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNode(_ArchNode n, BoxConstraints c) {
    final active = _selectedId == n.id;
    return Positioned(
      left: n.x * c.maxWidth - 45,
      top: n.y * 320 - 22,
      child: FocusableActionDetector(
        mouseCursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => setState(() => _selectedId = n.id),
          child: AnimatedContainer(
            duration: AppMotion.fast,
            width: 90,
            height: 44,
            decoration: BoxDecoration(
              color: active ? AppColors.accent : Colors.black.withValues(alpha: 0.6),
              border: Border.all(
                color: active ? AppColors.accent : AppColors.accent.withValues(alpha: 0.3),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(AppRadius.xs),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  n.id,
                  style: TextStyle(
                    color: active ? Colors.black : Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'monospace',
                  ),
                ),
                Text(
                  n.label,
                  style: TextStyle(
                    color: active ? Colors.black.withValues(alpha: 0.7) : AppColors.accent.withValues(alpha: 0.7),
                    fontSize: 8,
                    fontFamily: 'monospace',
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

class _ArchNode {
  final String id;
  final String label;
  final double x, y;
  _ArchNode(this.id, this.label, this.x, this.y);
}

class _ArchPainter extends CustomPainter {
  final List<_ArchNode> nodes;
  final String? selectedId;
  _ArchPainter({required this.nodes, this.selectedId});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final w = size.width;
    final h = size.height;

    void drawConn(String id1, String id2) {
      final n1 = nodes.firstWhere((n) => n.id == id1);
      final n2 = nodes.firstWhere((n) => n.id == id2);
      final isHighlighted = selectedId == id1 || selectedId == id2;
      
      paint.color = isHighlighted ? AppColors.accent : AppColors.accent.withValues(alpha: 0.15);
      paint.strokeWidth = isHighlighted ? 2.0 : 1.0;
      
      canvas.drawLine(
        Offset(n1.x * w, n1.y * h),
        Offset(n2.x * w, n2.y * h),
        paint,
      );
    }

    drawConn('Flutter', 'Laravel');
    drawConn('Flutter', 'GetX');
    drawConn('Laravel', 'PostgreSQL');
    drawConn('GetX', 'Firebase');
    drawConn('GetX', 'AI Engine');
  }

  @override
  bool shouldRepaint(covariant _ArchPainter oldDelegate) => oldDelegate.selectedId != selectedId;
}

class _FeaturesGrid extends StatelessWidget {
  final Project project;
  const _FeaturesGrid({required this.project});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final features = project.keyFeatures.split('\n').where((s) => s.trim().isNotEmpty).toList();

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
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle_outline, color: AppColors.accent, size: 16),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(child: Text(features[i].replaceAll('•', '').trim(), style: t.monoBodySm)),
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
        Text(project.challenges, style: t.bodyLg),
      ],
    );
  }
}

class _AISection extends StatelessWidget {
  final Project project;
  const _AISection({required this.project});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return EditorialCard(
      overrideBorder: AppColors.accent.withValues(alpha: 0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionLabel(label: AppStrings.caseStudyAI),
          const SizedBox(height: AppSpacing.lg),
          Text(project.aiIntegration!, style: t.bodyLg),
        ],
      ),
    );
  }
}

class _TechnicalDetailsRow extends StatelessWidget {
  final Project project;
  const _TechnicalDetailsRow({required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (project.security != null) ...[
          _DetailBlock(label: AppStrings.caseStudySecurity, content: project.security!),
          const SizedBox(height: AppSpacing.xl),
        ],
        if (project.performance != null)
          _DetailBlock(label: AppStrings.caseStudyPerformance, content: project.performance!),
      ],
    );
  }
}

class _DetailBlock extends StatelessWidget {
  final String label;
  final String content;
  const _DetailBlock({required this.label, required this.content});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: label),
        const SizedBox(height: AppSpacing.lg),
        Text(content, style: t.bodyLg),
      ],
    );
  }
}

class _GallerySection extends StatelessWidget {
  final Project project;
  const _GallerySection({required this.project});

  @override
  Widget build(BuildContext context) {
    if (project.galleryImages == null || project.galleryImages!.isEmpty) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: AppStrings.caseStudyScreens),
        const SizedBox(height: AppSpacing.lg),
        SizedBox(
          height: 240,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: project.galleryImages!.length,
            separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.lg),
            itemBuilder: (context, i) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.sm),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(project.galleryImages![i], fit: BoxFit.cover),
                ),
              );
            },
          ),
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
        ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (_) => onPressed()),
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
