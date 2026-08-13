import 'package:flutter/material.dart';
import '../../../core/animations/animations.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/design_system.dart';
import '../../../core/theme/typography.dart';
import '../../../core/widgets/brand_monogram.dart';
import '../../../core/widgets/editorial_card.dart';
import '../../../core/widgets/signature_mark.dart';
import '../../../core/widgets/ui_primitives.dart';
import '../../identity/identity_page.dart';


class IdentitySection extends StatelessWidget {
  const IdentitySection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            label: AppStrings.identityEyebrow,
            title: AppStrings.identitySectionTitle,
            subtitle: AppStrings.identitySectionSub,
          ),
          const SizedBox(height: AppSpacing.xxl),
          RevealOnScroll(
            child: SmoothLift(
              lift: 4,
              child: EditorialCard(
                number: '01',
                tag: AppStrings.identityEyebrow,
                overrideBorder: AppColors.accent,
                semanticLabel: AppStrings.identitySectionTitle,
                onTap: () => _openIdentity(context),
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Visual hero of the card — monogram + signature
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.xl),
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.charcoal : AppColors.offWhite,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(AppRadius.md),
                        ),
                      ),
                      child: LayoutBuilder(
                        builder: (context, c) {
                          final stacked = c.maxWidth < 520;
                          final mark = Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BrandMonogram.mark(height: stacked ? 80 : 104),
                              const SizedBox(height: AppSpacing.md),
                              Text(
                                'THABIT BUDEIR',
                                style: t.labelInk.copyWith(
                                  letterSpacing: 3.0,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          );
                          final signature = SignatureMark(
                            height: stacked ? 56 : 72,
                            animated: false,
                            tint: isDark
                                ? AppColors.silver
                                : AppColors.charcoal,
                          );
                          if (stacked) {
                            return Column(
                              children: [
                                mark,
                                const SizedBox(height: AppSpacing.xl),
                                signature,
                              ],
                            );
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              mark,
                              Container(
                                width: 1,
                                height: 80,
                                color: isDark
                                    ? AppColors.darkLine
                                    : AppColors.lightLine,
                              ),
                              signature,
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppSpacing.xl),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 24,
                                height: 1,
                                color: AppColors.accent,
                              ),
                              const SizedBox(width: AppSpacing.md),
                              Expanded(
                                child: Text(
                                  AppStrings.brandStatement,
                                  style: t.labelAccent.copyWith(
                                    letterSpacing: 2.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          Text(
                            AppStrings.identityStoryTitle,
                            style: t.heading2,
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Text(
                            AppStrings.identityStoryBody,
                            style: t.body,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          Row(
                            children: [
                              Text(
                                AppStrings.identityViewCaseStudy,
                                style: t.button.copyWith(
                                  color: AppColors.accent,
                                  fontSize: 11,
                                ),
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Icon(
                                AppStrings.isRTL
                                    ? Icons.arrow_back_rounded
                                    : Icons.arrow_forward_rounded,
                                size: 14,
                                color: AppColors.accent,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openIdentity(BuildContext context) {
    Navigator.of(context).push(IdentityPage.route());
  }
}
