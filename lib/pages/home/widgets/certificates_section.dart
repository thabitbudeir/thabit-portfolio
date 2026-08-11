import 'package:flutter/material.dart';
import '../../../core/animations/animations.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/design_system.dart';
import '../../../core/theme/typography.dart';
import '../../../core/widgets/image_preview_modal.dart';
import '../../../core/widgets/ui_primitives.dart';
import '../../../data/models/certificate.dart';

class CertificatesSection extends StatelessWidget {
  const CertificatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final certificates = CertificateData.certificates;
    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            label: AppStrings.sectionCertificates,
            title: AppStrings.certificatesHeadline,
            subtitle: AppStrings.certificatesSub,
          ),
          const SizedBox(height: AppSpacing.xxl),
          LayoutBuilder(
            builder: (context, c) {
              final columns = c.maxWidth >= 1080
                  ? 3
                  : c.maxWidth >= 720
                  ? 2
                  : 1;
              final width = columns == 1
                  ? c.maxWidth
                  : (c.maxWidth - AppSpacing.lg * (columns - 1)) / columns;
              return Wrap(
                spacing: AppSpacing.lg,
                runSpacing: AppSpacing.lg,
                children: certificates.asMap().entries.map((entry) {
                  final i = entry.key;
                  final cert = entry.value;
                  return SizedBox(
                    width: width,
                    child: RevealOnScroll(
                      delay: Duration(milliseconds: 80 * i),
                      child: _CertCard(certificate: cert),
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

class _CertCard extends StatefulWidget {
  final Certificate certificate;
  const _CertCard({required this.certificate});

  @override
  State<_CertCard> createState() => _CertCardState();
}

class _CertCardState extends State<_CertCard> {
  bool _hovered = false;
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final active = _hovered || _focused;

    return Semantics(
      button: true,
      label:
          '${AppStrings.viewCertificate}: ${widget.certificate.title.value} from ${widget.certificate.organization.value}',
      child: FocusableActionDetector(
        onShowFocusHighlight: (v) => setState(() => _focused = v),
        onShowHoverHighlight: (v) => setState(() => _hovered = v),
        mouseCursor: SystemMouseCursors.click,
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) => _open(context),
          ),
        },
        child: GestureDetector(
          onTap: () => _open(context),
          child: AnimatedContainer(
            duration: AppMotion.fast,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.accentDim,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppRadius.sm),
                      topRight: Radius.circular(AppRadius.sm),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          widget.certificate.imageUrl,
                          fit: BoxFit.cover,
                          cacheWidth: 600,
                          errorBuilder: (context, error, stack) {
                            return Center(
                              child: Text(
                                'CERT',
                                style: t.labelAccent.copyWith(letterSpacing: 3),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: AppSpacing.md,
                        right: AppSpacing.md,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.sm,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.7),
                            borderRadius: BorderRadius.circular(AppRadius.xs),
                          ),
                          child: Text(
                            widget.certificate.date,
                            style: t.label.copyWith(
                              color: Colors.white,
                              letterSpacing: 1.2,
                              fontSize: 9,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.certificate.organization.value.toUpperCase(),
                        style: t.labelAccent,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(widget.certificate.title.value, style: t.heading3),
                      const SizedBox(height: AppSpacing.md),
                      Row(
                        children: [
                          Text(
                            AppStrings.viewCertificate,
                            style: t.monoBody.copyWith(
                              color: active ? AppColors.accent : null,
                              fontSize: 11,
                              letterSpacing: 1.4,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 12,
                            color: active ? AppColors.accent : null,
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
    );
  }

  void _open(BuildContext context) {
    ImagePreviewModal.show(
      context: context,
      imageUrl: widget.certificate.imageUrl,
      title: widget.certificate.title.value,
    );
  }
}
