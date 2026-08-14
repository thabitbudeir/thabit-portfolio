import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_colors.dart';
import '../theme/design_system.dart';
import '../theme/typography.dart';
import '../localization/app_strings.dart';
import 'buttons.dart';

class ImagePreviewModal extends StatelessWidget {
  final String imageUrl;
  final String? title;
  final String? actionUrl;
  final String? actionLabel;

  const ImagePreviewModal({
    super.key,
    required this.imageUrl,
    this.title,
    this.actionUrl,
    this.actionLabel,
  });

  static Future<void> show({
    required BuildContext context,
    required String imageUrl,
    String? title,
    String? actionUrl,
    String? actionLabel,
  }) {
    return showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.85),
      builder: (context) => ImagePreviewModal(
        imageUrl: imageUrl,
        title: title,
        actionUrl: actionUrl,
        actionLabel: actionLabel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(AppSpacing.xl),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 320,
                          height: 240,
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
                ),
                if (actionUrl != null && actionLabel != null) ...[
                  const SizedBox(height: AppSpacing.lg),
                  AppButton(
                    label: actionLabel!,
                    onPressed: () => _launch(actionUrl!),
                    kind: ButtonKind.primary,
                    showArrow: true,
                  ),
                ],
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Semantics(
              button: true,
              label: AppStrings.closePreview,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: const Icon(Icons.close_rounded,
                      size: 18, color: Colors.white),
                ),
              ),
            ),
          ),
          if (title != null)
            Positioned(
              left: 0,
              right: 0,
              bottom: (actionUrl != null) ? 80 : 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(AppRadius.xs),
                  ),
                  child: Text(title!, style: t.label.copyWith(color: Colors.white)),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
