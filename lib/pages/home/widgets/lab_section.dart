import 'package:flutter/material.dart';
import '../../../core/animations/animations.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/design_system.dart';
import '../../../core/theme/typography.dart';
import '../../../core/widgets/editorial_card.dart';
import '../../../core/widgets/ui_primitives.dart';
import '../../../data/models/lab_item.dart';

class LabSection extends StatelessWidget {
  const LabSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = LabData.items;
    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            label: AppStrings.sectionLab,
            title: AppStrings.get('Engineering Lab.', 'المختبر الهندسي.', 'Technik-Labor.'),
            subtitle: AppStrings.labHeadline,
          ),
          const SizedBox(height: AppSpacing.xxl),
          LayoutBuilder(
            builder: (context, c) {
              final cols = c.maxWidth > 900 ? 3 : (c.maxWidth > 600 ? 2 : 1);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  crossAxisSpacing: AppSpacing.lg,
                  mainAxisSpacing: AppSpacing.lg,
                  mainAxisExtent: 280,
                ),
                itemBuilder: (context, i) {
                  return RevealOnScroll(
                    delay: Duration(milliseconds: 100 * i),
                    child: _LabCard(item: items[i]),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _LabCard extends StatelessWidget {
  final LabItem item;
  const _LabCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return EditorialCard(
      tag: item.status,
      onTap: () => _showDetails(context),
      semanticLabel: '${AppStrings.labExplore}: ${item.title}',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.md),
          Text(item.title, style: t.heading2),
          const SizedBox(height: AppSpacing.sm),
          Text(
            item.description,
            style: t.body,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Text(item.technology, style: t.labelAccent.copyWith(fontSize: 9)),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Text(AppStrings.labExplore, style: t.button.copyWith(fontSize: 11)),
              const SizedBox(width: AppSpacing.sm),
              const Icon(Icons.arrow_forward_rounded, size: 12, color: AppColors.accent),
            ],
          ),
        ],
      ),
    );
  }

  void _showDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => _LabDetailsModal(item: item),
    );
  }
}

class _LabDetailsModal extends StatelessWidget {
  final LabItem item;
  const _LabDetailsModal({required this.item});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: AppColors.accent.withValues(alpha: 0.3)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(item.title, style: t.heading1)),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            _buildSection(context, AppStrings.labApproach, item.technicalApproach),
            const SizedBox(height: AppSpacing.lg),
            if (item.result != null) ...[
              _buildSection(context, 'RESULT', item.result!),
              const SizedBox(height: AppSpacing.lg),
            ],
            Text('${AppStrings.labStatus}: ${item.status}', style: t.labelAccent),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String label, String content) {
    final t = AppText.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: t.label),
        const SizedBox(height: 4),
        Text(content, style: t.body),
      ],
    );
  }
}
