import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/animations/animations.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/design_system.dart';
import '../../../core/theme/typography.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/ui_primitives.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.accent, width: 1),
              borderRadius: BorderRadius.circular(AppRadius.xs),
            ),
            child: Text(AppStrings.sectionContact, style: t.labelAccent),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            AppStrings.contactHeadline,
            style: t.display2.copyWith(fontSize: 56),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.lg),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 580),
            child: Text(
              AppStrings.contactBody,
              style: t.bodyLg,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          AppButton(
            label: AppStrings.sayHello,
            onPressed: () => _launch('mailto:thabitbudeir@example.com'),
            showArrow: true,
            leadingIcon: Icons.mail_outline_rounded,
          ),
          const SizedBox(height: AppSpacing.xxl),
          // Links as a 2-column "datasheet"
          Container(
            constraints: const BoxConstraints(maxWidth: 560),
            child: LayoutBuilder(
              builder: (context, c) {
                final stacked = c.maxWidth < 420;
                final entries = [
                  _ContactEntry(AppStrings.email, 'thabitbudeir@example.com', () {
                    _launch('mailto:thabitbudeir@example.com');
                  }),
                  _ContactEntry(AppStrings.linkedin, 'linkedin.com/in/thabitbudeir', () {
                    _launch('https://linkedin.com/in/thabitbudeir');
                  }),
                  _ContactEntry(AppStrings.github, 'github.com/thabitbudeir', () {
                    _launch('https://github.com/thabitbudeir');
                  }),
                  _ContactEntry(AppStrings.behance, 'behance.net/thabitbudeir', () {
                    _launch('https://behance.net/thabitbudeir');
                  }),
                ];
                if (stacked) {
                  return Column(
                    children: entries
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                              child: e,
                            ))
                        .toList(),
                  );
                }
                return Column(
                  children: [
                    for (int i = 0; i < entries.length; i++) ...[
                      entries[i],
                      if (i < entries.length - 1) Hairline(),
                    ],
                  ],
                );
              },
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

class _ContactEntry extends StatefulWidget {
  final String label;
  final String value;
  final VoidCallback onTap;
  const _ContactEntry(this.label, this.value, this.onTap);

  @override
  State<_ContactEntry> createState() => _ContactEntryState();
}

class _ContactEntryState extends State<_ContactEntry> {
  bool _hovered = false;
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final active = _hovered || _focused;

    return Semantics(
      button: true,
      label: '${widget.label}: ${widget.value}',
      child: FocusableActionDetector(
        onShowFocusHighlight: (v) => setState(() => _focused = v),
        onShowHoverHighlight: (v) => setState(() => _hovered = v),
        mouseCursor: SystemMouseCursors.click,
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) => widget.onTap(),
          ),
        },
        child: GestureDetector(
          onTap: widget.onTap,
          behavior: HitTestBehavior.opaque,
          child: AnimatedContainer(
            duration: AppMotion.fast,
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.md, horizontal: AppSpacing.sm),
            decoration: BoxDecoration(
              color: _focused ? AppColors.accent.withValues(alpha: 0.05) : Colors.transparent,
              borderRadius: BorderRadius.circular(AppRadius.xs),
              border: Border.all(
                color: _focused ? AppColors.accent.withValues(alpha: 0.3) : Colors.transparent,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: active ? AppColors.accent : (isDark ? AppColors.darkInkMute : AppColors.lightInkMute),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                SizedBox(
                  width: 100,
                  child: Text(widget.label.toUpperCase(), style: t.label),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Text(
                    widget.value,
                    style: t.monoBody.copyWith(
                      color: active ? AppColors.accent : null,
                      fontSize: 13,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_outward_rounded,
                  size: 14,
                  color: active ? AppColors.accent : (isDark ? AppColors.darkInkMute : AppColors.lightInkMute),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
