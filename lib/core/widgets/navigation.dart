import 'package:flutter/material.dart';
import '../localization/app_strings.dart';
import '../theme/app_colors.dart';
import '../theme/design_system.dart';
import '../theme/typography.dart';
import 'binary_animation.dart';
import 'buttons.dart';

class AppNavigation extends StatefulWidget {
  final Function(AppLanguage) onLanguageChanged;
  final Function(bool) onThemeChanged;
  final int activeSectionIndex;
  final Function(int) onSectionTapped;
  final double scrollOffset;
  final bool recruiterMode;
  final ValueChanged<bool> onRecruiterModeChanged;

  const AppNavigation({
    super.key,
    required this.onLanguageChanged,
    required this.onThemeChanged,
    required this.activeSectionIndex,
    required this.onSectionTapped,
    required this.scrollOffset,
    required this.recruiterMode,
    required this.onRecruiterModeChanged,
  });

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  bool get _elevated => widget.scrollOffset > 8;

  void _showMobileMenu() {
    final links = [
      AppStrings.navHome,
      AppStrings.navWhatIDo,
      AppStrings.navAbout,
      AppStrings.navCurrent,
      AppStrings.navProjects,
      AppStrings.navSkills,
      AppStrings.navDesigns,
      AppStrings.navCertificates,
      AppStrings.navExperience,
      AppStrings.navContact,
    ];

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Close Menu',
      barrierColor: Colors.black.withValues(alpha: 0.6),
      transitionDuration: AppMotion.base,
      pageBuilder: (context, anim1, anim2) {
        return _MobileMenu(
          links: links,
          activeIndex: widget.activeSectionIndex,
          recruiterMode: widget.recruiterMode,
          onLinkTap: (i) {
            widget.onSectionTapped(i);
            Navigator.pop(context);
          },
          onClose: () => Navigator.pop(context),
          onThemeChanged: widget.onThemeChanged,
          onLanguageChanged: widget.onLanguageChanged,
          onRecruiterModeChanged: widget.onRecruiterModeChanged,
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        final begin = AppStrings.isRTL ? const Offset(-1.0, 0.0) : const Offset(1.0, 0.0);
        return SlideTransition(
          position: Tween<Offset>(begin: begin, end: Offset.zero).animate(
            CurvedAnimation(parent: anim1, curve: AppMotion.standard),
          ),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < AppBreakpoints.tablet;

    final links = [
      AppStrings.navHome,
      AppStrings.navWhatIDo,
      AppStrings.navAbout,
      AppStrings.navCurrent,
      AppStrings.navProjects,
      AppStrings.navSkills,
      AppStrings.navDesigns,
      AppStrings.navCertificates,
      AppStrings.navExperience,
      AppStrings.navContact,
    ];

    final List<int> desktopIndices = widget.recruiterMode 
        ? [0, 2, 4, 8, 9] 
        : [0, 2, 4, 5, 9];

    final bg = isDark ? AppColors.darkBackground : AppColors.lightBackground;
    final line = isDark ? AppColors.darkLine : AppColors.lightLine;

    final hPad = width >= AppBreakpoints.desktop
        ? AppLayout.sectionPadDesktop
        : width >= AppBreakpoints.tablet
            ? AppLayout.sectionPadTablet
            : AppLayout.sectionPadMobile;

    return AnimatedContainer(
      duration: AppMotion.fast,
      height: AppLayout.navHeight,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: _elevated ? bg.withValues(alpha: 0.96) : bg.withValues(alpha: 0.88),
        border: Border(bottom: BorderSide(color: line, width: 1)),
      ),
      child: Stack(
        children: [
          const Positioned.fill(
            child: BinaryBackground(height: AppLayout.navHeight),
          ),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: hPad),
              child: Row(
                children: [
                  _BrandLockup(onTap: () => widget.onSectionTapped(0)),
                  const SizedBox(width: AppSpacing.xl),
                  if (!isMobile) ...[
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: desktopIndices.map((i) {
                            return _NavItem(
                              label: links[i],
                              index: i,
                              active: widget.activeSectionIndex == i,
                              onTap: () => widget.onSectionTapped(i),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.lg),
                    _RecruiterToggle(
                      active: widget.recruiterMode,
                      onChanged: widget.onRecruiterModeChanged,
                    ),
                    const SizedBox(width: AppSpacing.md),
                    _LangSwitcher(onLanguageChanged: widget.onLanguageChanged),
                    const SizedBox(width: AppSpacing.sm),
                    _ThemeSwitcher(onThemeChanged: widget.onThemeChanged),
                    const SizedBox(width: AppSpacing.md),
                    AppButton(
                      label: AppStrings.contactMe,
                      compact: true,
                      showArrow: true,
                      onPressed: () => widget.onSectionTapped(links.length - 1),
                    ),
                  ] else ...[
                    const Spacer(),
                    _RecruiterToggle(
                      active: widget.recruiterMode,
                      onChanged: widget.onRecruiterModeChanged,
                      compact: true,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Semantics(
                      button: true,
                      label: AppStrings.menuOpen,
                      child: FocusableActionDetector(
                        mouseCursor: SystemMouseCursors.click,
                        actions: {
                          ActivateIntent: CallbackAction<ActivateIntent>(
                            onInvoke: (_) => _showMobileMenu(),
                          ),
                        },
                        child: GestureDetector(
                          onTap: _showMobileMenu,
                          child: Container(
                            padding: const EdgeInsets.all(AppSpacing.sm),
                            child: Icon(
                              Icons.menu_rounded,
                              size: 22,
                              color: isDark
                                  ? AppColors.darkInk
                                  : AppColors.lightInk,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BrandLockup extends StatelessWidget {
  final VoidCallback onTap;
  const _BrandLockup({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return Semantics(
      button: true,
      label: AppStrings.goToHome,
      child: FocusableActionDetector(
        mouseCursor: SystemMouseCursors.click,
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) => onTap(),
          ),
        },
        child: GestureDetector(
          onTap: onTap,
          child: Text('TB', style: t.labelInk.copyWith(letterSpacing: 2.0)),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final int index;
  final bool active;
  final VoidCallback onTap;
  const _NavItem({
    required this.label,
    required this.index,
    required this.active,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovered = false;
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final active = widget.active;
    final color = active
        ? AppColors.accent
        : _hovered || _focused
            ? (isDark ? AppColors.darkInk : AppColors.lightInk)
            : (isDark ? AppColors.darkInkSoft : AppColors.lightInkSoft);

    return FocusableActionDetector(
      onShowFocusHighlight: (v) => setState(() => _focused = v),
      onShowHoverHighlight: (v) => setState(() => _hovered = v),
      mouseCursor: SystemMouseCursors.click,
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) {
            widget.onTap();
            return null;
          },
        ),
      },
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.index.toString().padLeft(2, '0'),
                    style: t.labelAccent.copyWith(
                      fontSize: 9,
                      color: active ? AppColors.accent : AppColors.accentDim,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(widget.label, style: t.button.copyWith(color: color)),
                ],
              ),
              const SizedBox(height: 6),
              AnimatedContainer(
                duration: AppMotion.fast,
                width: (active || _focused) ? 16 : (_hovered ? 8 : 0),
                height: 1,
                color: AppColors.accent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecruiterToggle extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;
  final bool compact;
  const _RecruiterToggle({required this.active, required this.onChanged, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = active ? AppColors.accent : (isDark ? AppColors.darkInkSoft : AppColors.lightInkSoft);

    return Tooltip(
      message: AppStrings.recruiterHint,
      child: FocusableActionDetector(
        mouseCursor: SystemMouseCursors.click,
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (_) => onChanged(!active)),
        },
        child: GestureDetector(
          onTap: () => onChanged(!active),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: active ? AppColors.accent : (isDark ? AppColors.darkLine : AppColors.lightLine), width: 1),
              borderRadius: BorderRadius.circular(AppRadius.sm),
              color: active ? AppColors.accent.withValues(alpha: 0.1) : Colors.transparent,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.work_outline_rounded, size: 14, color: color),
                if (!compact) ...[
                  const SizedBox(width: AppSpacing.sm),
                  Text(AppStrings.recruiterMode, style: t.label.copyWith(color: color, fontSize: 10)),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LangSwitcher extends StatefulWidget {
  final Function(AppLanguage) onLanguageChanged;
  final bool compact;
  const _LangSwitcher({
    super.key,
    required this.onLanguageChanged,
    this.compact = false,
  });

  @override
  State<_LangSwitcher> createState() => _LangSwitcherState();
}

class _LangSwitcherState extends State<_LangSwitcher> {
  int _focusedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final line = isDark ? AppColors.darkLine : AppColors.lightLine;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: line, width: 1),
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: AppLanguage.values.asMap().entries.map((entry) {
          final i = entry.key;
          final lang = entry.value;
          final selected = AppStrings.currentLanguage == lang;
          final focused = _focusedIndex == i;

          return FocusableActionDetector(
            onShowFocusHighlight: (v) => setState(() => _focusedIndex = v ? i : -1),
            mouseCursor: SystemMouseCursors.click,
            actions: {
              ActivateIntent: CallbackAction<ActivateIntent>(
                onInvoke: (_) => widget.onLanguageChanged(lang),
              ),
            },
            child: GestureDetector(
              onTap: () => widget.onLanguageChanged(lang),
              child: AnimatedContainer(
                duration: AppMotion.fast,
                padding: EdgeInsets.symmetric(
                  horizontal: widget.compact ? 8 : 10,
                  vertical: widget.compact ? 6 : 7,
                ),
                decoration: BoxDecoration(
                  color: selected ? AppColors.accent : (focused ? AppColors.accent.withValues(alpha: 0.1) : Colors.transparent),
                  borderRadius: BorderRadius.circular(AppRadius.xs),
                  border: focused ? Border.all(color: AppColors.accent, width: 1) : null,
                ),
                child: Text(
                  lang.name.toUpperCase(),
                  style: t.label.copyWith(
                    color: selected
                        ? const Color(0xFF0B0C0A)
                        : (isDark
                            ? AppColors.darkInkSoft
                            : AppColors.lightInkSoft),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _ThemeSwitcher extends StatefulWidget {
  final Function(bool) onThemeChanged;
  const _ThemeSwitcher({super.key, required this.onThemeChanged});

  @override
  State<_ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<_ThemeSwitcher> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final line = isDark ? AppColors.darkLine : AppColors.lightLine;
    return FocusableActionDetector(
      onShowFocusHighlight: (v) => setState(() => _focused = v),
      mouseCursor: SystemMouseCursors.click,
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) => widget.onThemeChanged(!isDark),
        ),
      },
      child: GestureDetector(
        onTap: () => widget.onThemeChanged(!isDark),
        child: AnimatedContainer(
          duration: AppMotion.fast,
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            border: Border.all(color: _focused ? AppColors.accent : line, width: 1),
            borderRadius: BorderRadius.circular(AppRadius.sm),
            color: _focused ? AppColors.accent.withValues(alpha: 0.05) : Colors.transparent,
          ),
          child: Icon(
            isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            size: 16,
            color: isDark ? AppColors.darkInk : AppColors.lightInk,
          ),
        ),
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  final List<String> links;
  final int activeIndex;
  final bool recruiterMode;
  final Function(int) onLinkTap;
  final VoidCallback onClose;
  final Function(bool) onThemeChanged;
  final Function(AppLanguage) onLanguageChanged;
  final ValueChanged<bool> onRecruiterModeChanged;

  const _MobileMenu({
    required this.links,
    required this.activeIndex,
    required this.recruiterMode,
    required this.onLinkTap,
    required this.onClose,
    required this.onThemeChanged,
    required this.onLanguageChanged,
    required this.onRecruiterModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final line = isDark ? AppColors.darkLine : AppColors.lightLine;
    
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // Close area (background)
          Positioned.fill(
            child: GestureDetector(onTap: onClose),
          ),
          Align(
            alignment: AppStrings.isRTL
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: GestureDetector(
              onTap: () {}, // Prevent dismissal when clicking menu
              child: Container(
                width: 300,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
                  border: Border(
                    left: AppStrings.isRTL ? BorderSide.none : BorderSide(color: line, width: 1),
                    right: AppStrings.isRTL ? BorderSide(color: line, width: 1) : BorderSide.none,
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: AppSpacing.md),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                        child: Row(
                          children: [
                            Text('TB', style: t.heading2.copyWith(letterSpacing: 2.0)),
                            const Spacer(),
                            _RecruiterToggle(active: recruiterMode, onChanged: onRecruiterModeChanged, compact: true),
                            const SizedBox(width: AppSpacing.sm),
                            IconButton(
                              onPressed: onClose,
                              icon: const Icon(Icons.close_rounded, size: 24),
                              tooltip: AppStrings.menuClose,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      Container(height: 1, color: line),
                      Expanded(
                        child: ListView.builder(
                          itemCount: links.length,
                          itemBuilder: (context, i) {
                            final active = activeIndex == i;
                            return _MobileMenuItem(
                              label: links[i],
                              index: i,
                              active: active,
                              onTap: () => onLinkTap(i),
                            );
                          },
                        ),
                      ),
                      Container(height: 1, color: line),
                      Padding(
                        padding: const EdgeInsets.all(AppSpacing.lg),
                        child: Row(
                          children: [
                            _LangSwitcher(onLanguageChanged: onLanguageChanged),
                            const Spacer(),
                            _ThemeSwitcher(onThemeChanged: onThemeChanged),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileMenuItem extends StatefulWidget {
  final String label;
  final int index;
  final bool active;
  final VoidCallback onTap;

  const _MobileMenuItem({
    required this.label,
    required this.index,
    required this.active,
    required this.onTap,
  });

  @override
  State<_MobileMenuItem> createState() => _MobileMenuItemState();
}

class _MobileMenuItemState extends State<_MobileMenuItem> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final active = widget.active;

    return FocusableActionDetector(
      onShowFocusHighlight: (v) => setState(() => _focused = v),
      mouseCursor: SystemMouseCursors.click,
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) => widget.onTap(),
        ),
      },
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: (active || _focused)
                    ? AppColors.accent
                    : Colors.transparent,
                width: 2,
              ),
              bottom: _focused ? BorderSide(color: AppColors.accent.withValues(alpha: 0.1)) : BorderSide.none,
            ),
            color: _focused ? AppColors.accent.withValues(alpha: 0.05) : null,
          ),
          child: Row(
            children: [
              Text(
                widget.index.toString().padLeft(2, '0'),
                style: t.labelAccent.copyWith(
                  color: active
                      ? AppColors.accent
                      : AppColors.accentDim,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Text(
                widget.label,
                style: t.heading3.copyWith(
                  color: active
                      ? AppColors.accent
                      : (isDark
                          ? AppColors.darkInk
                          : AppColors.lightInk),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
