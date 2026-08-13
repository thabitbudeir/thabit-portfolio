import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/design_system.dart';
import '../theme/typography.dart';


class EditorialCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final String? number;
  final String? tag;
  final EdgeInsetsGeometry padding;
  final bool dense;
  final Color? overrideBorder;
  final String? semanticLabel;

  const EditorialCard({
    super.key,
    required this.child,
    this.onTap,
    this.number,
    this.tag,
    this.padding = const EdgeInsets.all(AppSpacing.lg),
    this.dense = false,
    this.overrideBorder,
    this.semanticLabel,
  });

  @override
  State<EditorialCard> createState() => _EditorialCardState();
}

class _EditorialCardState extends State<EditorialCard> {
  bool _hovered = false;
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final line = isDark ? AppColors.darkLine : AppColors.lightLine;
    final accent = context.accent;

    final borderColor =
        widget.overrideBorder ??
        ((_hovered || _focused) ? accent.withValues(alpha: 0.8) : line);

    final interactive = widget.onTap != null;

    Widget content = AnimatedContainer(
      duration: AppMotion.fast,
      curve: AppMotion.standard,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        border: Border.all(color: borderColor, width: _focused ? 2 : 1),
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Stack(
        children: [
          if (widget.number != null)
            Positioned(
              top: AppSpacing.md,
              right: AppSpacing.lg,
              child: Text(
                widget.number!,
                style: t.label.copyWith(
                  color: (_hovered || _focused) ? accent : null,
                  letterSpacing: 1.4,
                ),
              ),
            ),
          if (widget.tag != null)
            Positioned(
              top: AppSpacing.md,
              left: AppSpacing.lg,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: line, width: 1),
                  borderRadius: BorderRadius.circular(AppRadius.xs),
                ),
                child: Text(
                  widget.tag!.toUpperCase(),
                  style: t.label.copyWith(
                    color: accent,
                    fontSize: 10,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          Padding(
            padding: widget.tag != null
                ? widget.padding.add(const EdgeInsets.only(top: AppSpacing.lg))
                : widget.padding,
            child: widget.child,
          ),
        ],
      ),
    );

    if (!interactive) {
      return content;
    }

    return Semantics(
      button: true,
      label: widget.semanticLabel,
      child: FocusableActionDetector(
        onShowFocusHighlight: (v) => setState(() => _focused = v),
        onShowHoverHighlight: (v) => setState(() => _hovered = v),
        mouseCursor: SystemMouseCursors.click,
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) => widget.onTap?.call(),
          ),
        },
        child: GestureDetector(onTap: widget.onTap, child: content),
      ),
    );
  }
}

class AsymmetricPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool accentEdge;
  final bool accentBottom;
  final Color? background;

  const AsymmetricPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.xl),
    this.accentEdge = false,
    this.accentBottom = false,
    this.background,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final line = isDark ? AppColors.darkLine : AppColors.lightLine;
    final bg =
        background ?? (isDark ? AppColors.darkSurface : AppColors.lightSurface);

    return Container(
      decoration: BoxDecoration(
        color: bg,
        border: Border(
          top: BorderSide(color: line, width: 1),
          right: BorderSide(color: line, width: 1),
          bottom: BorderSide(color: line, width: 1),
          left: BorderSide(
            color: accentEdge ? AppColors.accent : line,
            width: accentEdge ? 2 : 1,
          ),
        ),
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      padding: padding,
      child: Stack(
        children: [
          child,
          if (accentBottom)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 2,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.accent, Colors.transparent],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class TechChip extends StatefulWidget {
  final String label;
  final bool accent;
  final bool dense;

  const TechChip({
    super.key,
    required this.label,
    this.accent = false,
    this.dense = false,
  });

  @override
  State<TechChip> createState() => _TechChipState();
}

class _TechChipState extends State<TechChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final line = isDark ? AppColors.darkLine : AppColors.lightLine;

    final color = _hovered || widget.accent
        ? AppColors.accent
        : (isDark ? AppColors.darkInkSoft : AppColors.lightInkSoft);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: AppMotion.fast,
        curve: AppMotion.standard,
        padding: EdgeInsets.symmetric(
          horizontal: widget.dense ? AppSpacing.sm : AppSpacing.md,
          vertical: widget.dense ? 4 : 6,
        ),
        decoration: BoxDecoration(
          color: (_hovered || widget.accent)
              ? AppColors.accent.withValues(alpha: 0.08)
              : Colors.transparent,
          border: Border.all(
            color: (_hovered || widget.accent)
                ? AppColors.accent.withValues(alpha: 0.5)
                : line,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(AppRadius.xs),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              widget.label.toUpperCase(),
              style: t.label.copyWith(
                color: color,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
