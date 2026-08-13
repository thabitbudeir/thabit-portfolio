import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/design_system.dart';
import '../theme/typography.dart';

enum ButtonKind { primary, secondary, ghost, link }

class AppButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonKind kind;
  final IconData? leadingIcon;
  final bool showArrow;
  final bool compact;
  final String? semanticLabel;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.kind = ButtonKind.primary,
    this.leadingIcon,
    this.showArrow = false,
    this.compact = false,
    this.semanticLabel,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _hovered = false;
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final disabled = widget.onPressed == null;

    final ink = isDark ? AppColors.darkInk : AppColors.lightInk;
    final line = isDark ? AppColors.darkLine : AppColors.lightLine;

    final accent = scheme.primary;
    final accentHover = scheme.secondary;
    final onAccent = scheme.onPrimary;

    Color background;
    Color foreground;
    Color? borderColor;

    switch (widget.kind) {
      case ButtonKind.primary:
        background = (_hovered || _focused) ? accentHover : accent;
        foreground = onAccent;
        borderColor = null;
        break;
      case ButtonKind.secondary:
        background = isDark ? AppColors.darkSurface : AppColors.lightSurface;
        foreground = (_hovered || _focused) ? accent : ink;
        borderColor = (_hovered || _focused) ? accent : line;
        break;
      case ButtonKind.ghost:
        background = Colors.transparent;
        foreground = (_hovered || _focused) ? accent : ink;
        borderColor = (_hovered || _focused) ? accent : line;
        break;
      case ButtonKind.link:
        background = Colors.transparent;
        foreground = (_hovered || _focused) ? accent : ink;
        borderColor = null;
        break;
    }

    final hPad = widget.compact ? AppSpacing.md : AppSpacing.lg;
    final vPad = widget.compact ? 10.0 : 14.0;
    final lift = _hovered && !disabled ? -1.0 : 0.0;

    return Semantics(
      button: true,
      label: widget.semanticLabel ?? widget.label,
      enabled: !disabled,
      child: FocusableActionDetector(
        onShowFocusHighlight: (v) => setState(() => _focused = v),
        onShowHoverHighlight: (v) => setState(() => _hovered = v),
        mouseCursor: disabled
            ? SystemMouseCursors.forbidden
            : SystemMouseCursors.click,
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) => widget.onPressed?.call(),
          ),
        },
        child: GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: AppMotion.fast,
            curve: AppMotion.standard,
            padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
            decoration: BoxDecoration(
              color: disabled ? background.withValues(alpha: 0.4) : background,
              border: borderColor != null
                  ? Border.all(color: borderColor, width: _focused ? 2 : 1)
                  : _focused
                  ? Border.all(
                      color: AppColors.accent.withValues(alpha: 0.7),
                      width: 2,
                    )
                  : null,
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            transform: Matrix4.translationValues(0, lift, 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.leadingIcon != null) ...[
                  Icon(widget.leadingIcon, size: 14, color: foreground),
                  const SizedBox(width: AppSpacing.sm),
                ],
                Text(
                  widget.label,
                  style:
                      (widget.kind == ButtonKind.primary
                              ? t.buttonOnAccent
                              : t.button)
                          .copyWith(color: foreground),
                ),
                if (widget.showArrow) ...[
                  const SizedBox(width: AppSpacing.sm),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 14,
                    color: foreground,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
