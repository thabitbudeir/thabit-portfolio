import 'package:flutter/material.dart';
import '../../../core/animations/animations.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/design_system.dart';
import '../../../core/theme/typography.dart';
import '../../../core/widgets/image_preview_modal.dart';
import '../../../core/widgets/ui_primitives.dart';
import '../../../data/models/design.dart';

class DesignsSection extends StatelessWidget {
  const DesignsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final designs = DesignData.designs;
    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            label: AppStrings.sectionDesigns,
            title: AppStrings.get(
                'UI/UX gallery.',
                'معرض تصاميم UI/UX.',
                'UI/UX-Galerie.'),
            subtitle: AppStrings.get(
              'Interface work — product, mobile, and web.',
              'أعمال واجهات — منتجات، موبايل، وويب.',
              'Interface-Arbeit — Produkt, Mobile und Web.',
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          RevealOnScroll(
            child: _BentoGrid(designs: designs),
          ),
        ],
      ),
    );
  }
}

class _BentoGrid extends StatelessWidget {
  final List<Design> designs;
  const _BentoGrid({required this.designs});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final isWide = c.maxWidth >= 980;
        final isMid = c.maxWidth >= 700;
        if (!isMid) {
          return Column(
            children: designs
                .map((item) => Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                      child: _DesignTile(design: item, height: 240),
                    ))
                .toList(),
          );
        }
        final columns = isWide ? 3 : 2;
        final width =
            (c.maxWidth - (AppSpacing.lg * (columns - 1))) / columns;
        return Wrap(
          spacing: AppSpacing.lg,
          runSpacing: AppSpacing.lg,
          children: designs.map((item) {
            final large = item.isLarge && isWide;
            return SizedBox(
              width: large ? (width * 2 + AppSpacing.lg) : width,
              child: _DesignTile(
                design: item,
                height: large ? 360 : 240,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _DesignTile extends StatefulWidget {
  final Design design;
  final double height;
  const _DesignTile({required this.design, required this.height});

  @override
  State<_DesignTile> createState() => _DesignTileState();
}

class _DesignTileState extends State<_DesignTile> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _open(context),
        child: AnimatedContainer(
          duration: AppMotion.base,
          curve: AppMotion.standard,
          height: widget.height,
          decoration: BoxDecoration(
            border: Border.all(
              color: _hovered
                  ? AppColors.accent.withValues(alpha: 0.5)
                  : (Theme.of(context).brightness == Brightness.dark
                      ? AppColors.darkLine
                      : AppColors.lightLine),
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
                    scale: _hovered ? 1.04 : 1.0,
                    duration: AppMotion.slow,
                    curve: AppMotion.standard,
                    child: Image.asset(
                      widget.design.imageUrl,
                      fit: BoxFit.cover,
                      cacheWidth: 800,
                      errorBuilder: (context, error, stack) {
                        return Container(
                          color: AppColors.accentDim,
                          alignment: Alignment.center,
                          child: Text(
                            widget.design.title.toUpperCase(),
                            style: t.labelAccent.copyWith(letterSpacing: 2.4),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              // Bottom info bar
              Positioned(
                left: AppSpacing.md,
                right: AppSpacing.md,
                bottom: AppSpacing.md,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.72),
                    borderRadius: BorderRadius.circular(AppRadius.xs),
                    border: Border.all(
                      color: _hovered ? AppColors.accent : Colors.white24,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.design.title,
                              style: t.heading3.copyWith(color: Colors.white),
                            ),
                            Text(
                              widget.design.category,
                              style: t.label.copyWith(
                                color: AppColors.accent,
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_outward_rounded,
                        size: 14,
                        color: _hovered ? AppColors.accent : Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _open(BuildContext context) {
    ImagePreviewModal.show(
      context: context,
      imageUrl: widget.design.imageUrl,
      title: widget.design.title,
    );
  }
}
