import 'package:flutter/material.dart';
import '../../core/animations/animations.dart';
import '../../core/localization/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/design_system.dart';
import '../../core/theme/typography.dart';
import '../../core/widgets/brand_monogram.dart';
import '../../core/widgets/buttons.dart';
import '../../core/widgets/editorial_card.dart';
import '../../core/widgets/image_preview_modal.dart';
import '../../core/widgets/signature_mark.dart';
import '../../core/widgets/ui_primitives.dart';


class IdentityPage extends StatelessWidget {
  const IdentityPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const IdentityPage());
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
              SliverToBoxAdapter(child: _IdentityHero(isDark: isDark)),
              SliverToBoxAdapter(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: AppLayout.maxWidth,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                        vertical: AppSpacing.xxl,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _SectionLabel(label: AppStrings.identityEyebrow),
                          const SizedBox(height: AppSpacing.lg),
                          Text(
                            AppStrings.identitySectionTitle,
                            style: AppText.of(context).display3,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: AppLayout.readingWidth,
                            ),
                            child: Text(
                              AppStrings.identitySectionSub,
                              style: AppText.of(context).bodyLg,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xxl),
                          _CaseBlock(
                            label: AppStrings.identityWhyNowLabel,
                            title: AppStrings.identityWhyNowTitle,
                            body: AppStrings.identityWhyNowBody,
                          ),
                          const SizedBox(height: AppSpacing.xxl),
                          _CaseBlock(
                            label: AppStrings.identityStoryLabel,
                            title: AppStrings.identityStoryTitle,
                            body: AppStrings.identityStoryBody,
                          ),
                          const SizedBox(height: AppSpacing.xl),
                          _StoryRow(isDark: isDark),
                          const SizedBox(height: AppSpacing.xxl),
                          _CaseBlock(
                            label: AppStrings.identityTechLabel,
                            title: AppStrings.identityTechTitle,
                          ),
                          const SizedBox(height: AppSpacing.xl),
                          _TechPanels(isDark: isDark),
                          const SizedBox(height: AppSpacing.xxl),
                          _AssetsGrid(isDark: isDark),
                          const SizedBox(height: AppSpacing.xxl),
                          _AttributesGrid(),
                          const SizedBox(height: AppSpacing.xxl),
                          _PhilosophyGrid(),
                          const SizedBox(height: AppSpacing.xxl),
                          const _ConclusionPanel(),
                          const SizedBox(height: AppSpacing.xl),
                          RevealOnScroll(
                            child: Text(
                              AppStrings.identityTags,
                              style: AppText.of(context).monoBodySm,
                            ),
                          ),
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
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  children: [
                    _BackButton(),
                    const Spacer(),
                    _CloseButton(onPressed: () => Navigator.of(context).pop()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: (isDark ? AppColors.darkBackground : AppColors.lightBackground)
            .withValues(alpha: 0.85),
        border: Border.all(
          color: isDark ? AppColors.darkLine : AppColors.lightLine,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          AppStrings.isRTL
              ? Icons.arrow_forward_rounded
              : Icons.arrow_back_rounded,
          size: 20,
        ),
        color: isDark ? AppColors.darkInk : AppColors.lightInk,
        tooltip: AppStrings.closeLabel,
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _CloseButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: (isDark ? AppColors.darkBackground : AppColors.lightBackground)
            .withValues(alpha: 0.85),
        border: Border.all(
          color: isDark ? AppColors.darkLine : AppColors.lightLine,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.close_rounded, size: 20),
        color: isDark ? AppColors.darkInk : AppColors.lightInk,
        tooltip: AppStrings.closeLabel,
      ),
    );
  }
}


class _IdentityHero extends StatelessWidget {
  final bool isDark;
  const _IdentityHero({required this.isDark});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.xxxl * 2,
        AppSpacing.lg,
        AppSpacing.xxl,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        border: Border(
          bottom: BorderSide(
            color: isDark ? AppColors.darkLine : AppColors.lightLine,
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppLayout.maxWidth),
          child: LayoutBuilder(
            builder: (context, c) {
              final stacked = c.maxWidth < 640;
              final mark = HeroEntrance(
                child: BrandMonogram.mark(height: stacked ? 96 : 140),
              );
              final title = HeroEntrance(
                delay: const Duration(milliseconds: 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'THABIT BUDEIR',
                      style: t.heading2.copyWith(
                        letterSpacing: 3.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Container(width: 48, height: 1, color: AppColors.accent),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      AppStrings.identityHeroRoleLine,
                      style: t.monoBodySm.copyWith(
                        letterSpacing: 1.4,
                        color: AppColors.accent,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(AppStrings.identityHeroDesc, style: t.bodySm),
                  ],
                ),
              );
              if (stacked) {
                return Column(
                  children: [
                    mark,
                    const SizedBox(height: AppSpacing.lg),
                    Center(child: title),
                  ],
                );
              }
              return Row(
                children: [
                  Expanded(flex: 5, child: Center(child: mark)),
                  const SizedBox(width: AppSpacing.xl),
                  Expanded(flex: 5, child: title),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
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

class _CaseBlock extends StatelessWidget {
  final String label;
  final String title;
  final String? body;
  const _CaseBlock({required this.label, required this.title, this.body});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return RevealOnScroll(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 16, height: 1, color: AppColors.accent),
              const SizedBox(width: AppSpacing.md),
              Text(label, style: t.labelAccent),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(title, style: t.heading1),
          if (body != null) ...[
            const SizedBox(height: AppSpacing.md),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppLayout.readingWidth,
              ),
              child: Text(body!, style: t.bodyLg),
            ),
          ],
        ],
      ),
    );
  }
}

class _StoryRow extends StatelessWidget {
  final bool isDark;
  const _StoryRow({required this.isDark});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return LayoutBuilder(
      builder: (context, c) {
        final stacked = c.maxWidth < 760;
        final monogramCard = EditorialCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.identityMonogramTitle, style: t.heading2),
              const SizedBox(height: AppSpacing.lg),
              SizedBox(
                height: 80,
                child: Center(child: BrandMonogram.mark(height: 64)),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(AppStrings.identityMonogramBody, style: t.body),
            ],
          ),
        );
        final balanceCard = EditorialCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.identityBalanceTitle, style: t.heading2),
              const SizedBox(height: AppSpacing.lg),
              SizedBox(
                height: 80,
                child: Center(
                  child: CustomPaint(
                    size: const Size(200, 60),
                    painter: _BalancePainter(isDark: isDark),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(AppStrings.identityBalanceBody, style: t.body),
            ],
          ),
        );
        if (stacked) {
          return Column(
            children: [
              monogramCard,
              const SizedBox(height: AppSpacing.xl),
              balanceCard,
            ],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: monogramCard),
            const SizedBox(width: AppSpacing.xl),
            Expanded(child: balanceCard),
          ],
        );
      },
    );
  }
}

class _BalancePainter extends CustomPainter {
  final bool isDark;
  _BalancePainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final accent = Paint()
      ..color = AppColors.accent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;
    final mute = Paint()
      ..color = (isDark ? AppColors.darkInkMute : AppColors.lightInkMute)
          .withValues(alpha: 0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.7;

    final cx = size.width / 2;
    final cy = size.height / 2;

    canvas.drawLine(Offset(cx, 8), Offset(cx, size.height - 8), accent);
    canvas.drawLine(Offset(20, cy), Offset(size.width - 20, cy), accent);

    final arcRect = Rect.fromCenter(
      center: Offset(cx, cy),
      width: size.width * 0.5,
      height: size.height * 0.9,
    );
    canvas.drawArc(arcRect, 0, 3.14159, false, mute);
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(cx, cy),
        width: size.width * 0.72,
        height: size.height * 1.2,
      ),
      0,
      3.14159,
      false,
      mute,
    );
  }

  @override
  bool shouldRepaint(covariant _BalancePainter oldDelegate) =>
      oldDelegate.isDark != isDark;
}

class _TechPanels extends StatelessWidget {
  final bool isDark;
  const _TechPanels({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final stacked = c.maxWidth < 760;
        final typography = _TypographyPanel(isDark: isDark);
        final colors = _ColorPanel(isDark: isDark);
        if (stacked) {
          return Column(
            children: [
              typography,
              const SizedBox(height: AppSpacing.xl),
              colors,
            ],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: typography),
            const SizedBox(width: AppSpacing.xl),
            Expanded(child: colors),
          ],
        );
      },
    );
  }
}

class _TypographyPanel extends StatelessWidget {
  final bool isDark;
  const _TypographyPanel({required this.isDark});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return EditorialCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.identityFontTitle, style: t.heading2),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Aa',
            style: AppType.serif(
              size: 48,
              color: isDark ? AppColors.darkInk : AppColors.lightInk,
            ),
          ),
          Text(
            'Modern Serif — Didot / Bodoni lineage',
            style: t.monoBodySm.copyWith(letterSpacing: 0.6, fontSize: 10),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Aa',
            style: AppType.sans(
              size: 48,
              weight: FontWeight.w600,
              color: isDark ? AppColors.darkInk : AppColors.lightInk,
            ),
          ),
          Text(
            'Humanist / Geometric Sans',
            style: t.monoBodySm.copyWith(letterSpacing: 0.6, fontSize: 10),
          ),
          const SizedBox(height: AppSpacing.lg),
          const Hairline(),
          const SizedBox(height: AppSpacing.lg),
          Text(AppStrings.identityFontBody, style: t.body),
          const SizedBox(height: AppSpacing.md),
          _InfoChip(label: 'SERIF — AUTHORITY'),
          const SizedBox(height: AppSpacing.sm),
          _InfoChip(label: 'SANS — TECHNICAL CLARITY', accent: true),
        ],
      ),
    );
  }
}

class _ColorPanel extends StatelessWidget {
  final bool isDark;
  const _ColorPanel({required this.isDark});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return EditorialCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.identityColorsTitle, style: t.heading2),
          const SizedBox(height: AppSpacing.lg),
          _ColorSwatch(
            name: AppStrings.colorCharcoalName,
            hex: '#1A1D21',
            desc: AppStrings.colorCharcoalDesc,
            swatchColor: AppColors.charcoal,
            isInverseText: true,
          ),
          const SizedBox(height: AppSpacing.md),
          _ColorSwatch(
            name: AppStrings.colorOffWhiteName,
            hex: '#F6F6F4',
            desc: AppStrings.colorOffWhiteDesc,
            swatchColor: AppColors.offWhite,
          ),
          const SizedBox(height: AppSpacing.md),
          _ColorSwatch(
            name: AppStrings.colorSilverName,
            hex: '#BFC3C9',
            desc: AppStrings.colorSilverDesc,
            swatchColor: AppColors.silver,
          ),
        ],
      ),
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  final String name;
  final String hex;
  final String desc;
  final Color swatchColor;
  final bool isInverseText;

  const _ColorSwatch({
    required this.name,
    required this.hex,
    required this.desc,
    required this.swatchColor,
    this.isInverseText = false,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final textColor = isInverseText ? AppColors.offWhite : AppColors.charcoal;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: swatchColor,
            border: Border.all(
              color: isInverseText
                  ? AppColors.silver.withValues(alpha: 0.3)
                  : AppColors.charcoal.withValues(alpha: 0.2),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(name, style: t.label.copyWith(color: textColor)),
                  const SizedBox(width: AppSpacing.sm),
                  Text(hex, style: t.monoBodySm.copyWith(fontSize: 9)),
                ],
              ),
              const SizedBox(height: 2),
              Text(desc, style: t.bodySm),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  final String label;
  final bool accent;
  const _InfoChip({required this.label, this.accent = false});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: accent
              ? AppColors.accent.withValues(alpha: 0.5)
              : (isDark ? AppColors.darkLine : AppColors.lightLine),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(AppRadius.xs),
      ),
      child: Text(
        label,
        style: t.label.copyWith(
          fontSize: 9,
          color: accent ? AppColors.accent : null,
        ),
      ),
    );
  }
}


class _AssetsGrid extends StatelessWidget {
  final bool isDark;
  const _AssetsGrid({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CaseBlock(
          label: AppStrings.identityElementsTitle.toUpperCase(),
          title: AppStrings.identityElementsTitle,
        ),
        const SizedBox(height: AppSpacing.xl),
        LayoutBuilder(
          builder: (context, c) {
            final cols = c.maxWidth >= 1100 ? 3 : (c.maxWidth >= 720 ? 2 : 1);
            return Wrap(
              spacing: AppSpacing.lg,
              runSpacing: AppSpacing.lg,
              children: List.generate(3, (i) {
                final width = cols == 1
                    ? c.maxWidth
                    : (c.maxWidth - AppSpacing.lg * (cols - 1)) / cols;
                final label = i == 0
                    ? AppStrings.identityPrimaryLogo
                    : i == 1
                    ? AppStrings.identityMonogram
                    : AppStrings.identitySignatureMark;
                final caption = i == 0
                    ? AppStrings.identityPrimaryLogoCaption
                    : i == 1
                    ? AppStrings.identityMonogramCaption
                    : AppStrings.identitySignatureCaption;
                return SizedBox(
                  width: width,
                  child: RevealOnScroll(
                    delay: Duration(milliseconds: 100 * i),
                    child: _AssetCard(
                      index: i,
                      label: label,
                      caption: caption,
                      isDark: isDark,
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ],
    );
  }
}

class _AssetCard extends StatelessWidget {
  final int index;
  final String label;
  final String caption;
  final bool isDark;

  const _AssetCard({
    required this.index,
    required this.label,
    required this.caption,
    required this.isDark,
  });

  static const List<String> _assets = [
    'assets/my_visual_identy/primary_logo-removebg-preview.png',
    'assets/my_visual_identy/monogram_icon-removebg-preview.png',
    'assets/my_visual_identy/signature_mark-removebg-preview.png',
  ];

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return GestureDetector(
      onTap: () => ImagePreviewModal.show(
        context: context,
        imageUrl: _assets[index],
        title: label,
      ),
      child: EditorialCard(
        number: '0${index + 1}',
        semanticLabel: '$label — ${AppStrings.viewDesign}',
        onTap: () => ImagePreviewModal.show(
          context: context,
          imageUrl: _assets[index],
          title: label,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: t.labelAccent),
            const SizedBox(height: AppSpacing.lg),
            SizedBox(
              height: 140,
              child: Center(
                child: Image.asset(
                  _assets[index],
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stack) {
                    switch (index) {
                      case 0:
                        return const Icon(
                          Icons.branding_watermark_outlined,
                          size: 48,
                          color: AppColors.accent,
                        );
                      case 1:
                        return BrandMonogram.mark(height: 80);
                      default:
                        return SignatureMark(
                          height: 72,
                          animated: false,
                          tint: isDark ? AppColors.silver : AppColors.charcoal,
                        );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(caption, style: t.monoBodySm.copyWith(fontSize: 9)),
          ],
        ),
      ),
    );
  }
}


class _AttributesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final attributes = [
      (AppStrings.attributeEngineeredTitle, AppStrings.attributeEngineeredBody),
      (AppStrings.attributeTechnicalTitle, AppStrings.attributeTechnicalBody),
      (AppStrings.attributePersonalTitle, AppStrings.attributePersonalBody),
      (AppStrings.attributeImpactTitle, AppStrings.attributeImpactBody),
    ];

    return LayoutBuilder(
      builder: (context, c) {
        final cols = c.maxWidth >= 1100 ? 4 : (c.maxWidth >= 760 ? 2 : 1);
        return Wrap(
          spacing: AppSpacing.lg,
          runSpacing: AppSpacing.lg,
          children: attributes.asMap().entries.map((entry) {
            final i = entry.key;
            final a = entry.value;
            final width = cols == 1
                ? c.maxWidth
                : (c.maxWidth - AppSpacing.lg * (cols - 1)) / cols;
            return SizedBox(
              width: width,
              child: RevealOnScroll(
                delay: Duration(milliseconds: 80 * i),
                child: EditorialCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _AttributeIcon(index: i),
                      const SizedBox(height: AppSpacing.lg),
                      Text(a.$1, style: AppText.of(context).labelAccent),
                      const SizedBox(height: AppSpacing.sm),
                      Text(a.$2, style: AppText.of(context).body),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _AttributeIcon extends StatelessWidget {
  final int index;
  const _AttributeIcon({required this.index});

  @override
  Widget build(BuildContext context) {
    final iconColor = AppColors.accent;
    final IconData icon;
    switch (index) {
      case 0:
        icon = Icons.hexagon_outlined;
        break;
      case 1:
        icon = Icons.code_rounded;
        break;
      case 2:
        icon = Icons.person_outline_rounded;
        break;
      default:
        icon = Icons.center_focus_strong_rounded;
        break;
    }
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.06),
        border: Border.all(
          color: AppColors.accent.withValues(alpha: 0.25),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Icon(icon, size: 18, color: iconColor),
    );
  }
}


class _PhilosophyGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CaseBlock(
          label: AppStrings.identityPhilosophyLabel,
          title: AppStrings.identityPhilosophyLabel,
        ),
        const SizedBox(height: AppSpacing.xl),
        LayoutBuilder(
          builder: (context, c) {
            final stacked = c.maxWidth < 760;
            final fontStyle = EditorialCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.identityFontStyleTitle, style: t.heading2),
                  const SizedBox(height: AppSpacing.md),
                  _BulletItem(label: AppStrings.identityFontPrimary),
                  const SizedBox(height: AppSpacing.md),
                  _BulletItem(label: AppStrings.identityFontSecondary),
                ],
              ),
            );
            final visual = EditorialCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.identityVisualTitle, style: t.heading2),
                  const SizedBox(height: AppSpacing.md),
                  _BulletItem(label: AppStrings.identityVisualBody),
                  const SizedBox(height: AppSpacing.lg),
                  const Hairline(),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    AppStrings.identityDesignConclusionTitle,
                    style: t.heading2,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _BulletItem(label: AppStrings.identityDesignConclusionBody),
                ],
              ),
            );
            if (stacked) {
              return Column(
                children: [
                  fontStyle,
                  const SizedBox(height: AppSpacing.xl),
                  visual,
                ],
              );
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: fontStyle),
                const SizedBox(width: AppSpacing.xl),
                Expanded(flex: 6, child: visual),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _BulletItem extends StatelessWidget {
  final String label;
  const _BulletItem({required this.label});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Container(
            width: 5,
            height: 5,
            decoration: const BoxDecoration(
              color: AppColors.accent,
              shape: BoxShape.circle,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(child: Text(label, style: t.body)),
      ],
    );
  }
}


class _ConclusionPanel extends StatelessWidget {
  const _ConclusionPanel();

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return RevealOnScroll(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        decoration: BoxDecoration(
          color: isDark ? AppColors.charcoal : AppColors.offWhite,
          border: Border.all(
            color: AppColors.accent.withValues(alpha: 0.5),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(width: 16, height: 1, color: AppColors.accent),
                const SizedBox(width: AppSpacing.md),
                Text(AppStrings.identityConclusionLabel, style: t.labelAccent),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(AppStrings.identityConclusionTitle, style: t.heading1),
            const SizedBox(height: AppSpacing.md),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppLayout.readingWidth,
              ),
              child: Text(AppStrings.identityConclusionBody, style: t.bodyLg),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              AppStrings.identityThanks,
              style: t.bodyLg.copyWith(color: AppColors.accent),
            ),
            const SizedBox(height: AppSpacing.xl),
            SizedBox(
              width: double.infinity,
              child: AppButton(
                label: AppStrings.closeLabel,
                kind: ButtonKind.secondary,
                leadingIcon: AppStrings.isRTL
                    ? Icons.arrow_forward_rounded
                    : Icons.arrow_back_rounded,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
