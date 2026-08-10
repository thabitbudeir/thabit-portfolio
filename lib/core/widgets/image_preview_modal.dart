import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/design_system.dart';
import '../theme/typography.dart';
import '../localization/app_strings.dart';

class ImagePreviewModal extends StatelessWidget {
  final String imageUrl;
  final String? title;
  const ImagePreviewModal({super.key, required this.imageUrl, this.title});

  static Future<void> show({
    required BuildContext context,
    required String imageUrl,
    String? title,
  }) {
    return showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.85),
      builder: (context) => ImagePreviewModal(imageUrl: imageUrl, title: title),
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
              bottom: 0,
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
                  child: Text(title!, style: t.label),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
