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

  const AppNavigation({
    super.key,
    required this.onLanguageChanged,
    required this.onThemeChanged,
    required this.activeSectionIndex,
    required this.onSectionTapped,
    required this.scrollOffset,
  });

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  bool _openMobile = false;

  bool get _elevated => widget.scrollOffset > 8;

  void _toggleMenu() => setState(() => _openMobile = !_openMobile);

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

    const desktopIndices = [0, 2, 4, 5, 9];

    final bg = isDark ? AppColors.darkBackground : AppColors.lightBackground;
    final line = isDark ? AppColors.darkLine : AppColors.lightLine;

    final hPad = width >= AppBreakpoints.desktop
        ? AppLayout.sectionPadDesktop
        : width >= AppBreakpoints.tablet
            ? AppLayout.sectionPadTablet
            : AppLayout.sectionPadMobile;

    return Stack(
      children: [
        AnimatedContainer(
          duration: AppMotion.fast,
          height: AppLayout.navHeight,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: _elevated ? bg.withOpacity(0.96) : bg.withOpacity(0.88),
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
                        _LangSwitcher(
                          onLanguageChanged: widget.onLanguageChanged,
                          compact: true,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        _ThemeSwitcher(onThemeChanged: widget.onThemeChanged),
                        const SizedBox(width: AppSpacing.xs),
                        Semantics(
                          button: true,
                          label: _openMobile ? 'Close menu' : 'Open menu',
                          child: GestureDetector(
                            onTap: _toggleMenu,
                            child: Container(
                              padding: const EdgeInsets.all(AppSpacing.sm),
                              child: Icon(
                                _openMobile
                                    ? Icons.close_rounded
                                    : Icons.menu_rounded,
                                size: 22,
                                color: isDark
                                    ? AppColors.darkInk
                                    : AppColors.lightInk,
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
        ),
        if (_openMobile)
          Positioned.fill(
            child: _MobileMenu(
              links: links,
              activeIndex: widget.activeSectionIndex,
              onLinkTap: (i) {
                widget.onSectionTapped(i);
                _toggleMenu();
              },
              onClose: _toggleMenu,
              onThemeChanged: widget.onThemeChanged,
              onLanguageChanged: widget.onLanguageChanged,
            ),
          ),
      ],
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
      label: 'Go to home',
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
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
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) {
            widget.onTap();
            return null;
          },
        ),
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
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
                  width: active ? 16 : (_hovered ? 8 : 0),
                  height: 1,
                  color: AppColors.accent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LangSwitcher extends StatelessWidget {
  final Function(AppLanguage) onLanguageChanged;
  final bool compact;
  const _LangSwitcher({
    required this.onLanguageChanged,
    this.compact = false,
  });

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
        children: AppLanguage.values.map((lang) {
          final selected = AppStrings.currentLanguage == lang;
          return GestureDetector(
            onTap: () => onLanguageChanged(lang),
            child: AnimatedContainer(
              duration: AppMotion.fast,
              padding: EdgeInsets.symmetric(
                horizontal: compact ? 8 : 10,
                vertical: compact ? 6 : 7,
              ),
              decoration: BoxDecoration(
                color: selected ? AppColors.accent : Colors.transparent,
                borderRadius: BorderRadius.circular(AppRadius.xs),
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
          );
        }).toList(),
      ),
    );
  }
}

class _ThemeSwitcher extends StatelessWidget {
  final Function(bool) onThemeChanged;
  const _ThemeSwitcher({required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final line = isDark ? AppColors.darkLine : AppColors.lightLine;
    return GestureDetector(
      onTap: () => onThemeChanged(!isDark),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          border: Border.all(color: line, width: 1),
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
        child: Icon(
          isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
          size: 16,
          color: isDark ? AppColors.darkInk : AppColors.lightInk,
        ),
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  final List<String> links;
  final int activeIndex;
  final Function(int) onLinkTap;
  final VoidCallback onClose;
  final Function(bool) onThemeChanged;
  final Function(AppLanguage) onLanguageChanged;

  const _MobileMenu({
    required this.links,
    required this.activeIndex,
    required this.onLinkTap,
    required this.onClose,
    required this.onThemeChanged,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final line = isDark ? AppColors.darkLine : AppColors.lightLine;
    return GestureDetector(
      onTap: onClose,
      child: Container(
        color: Colors.black.withOpacity(0.45),
        child: Align(
          alignment: AppStrings.isRTL
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 300,
              color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSpacing.md),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                      child: Text('TB', style: t.heading2.copyWith(letterSpacing: 2.0)),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Container(height: 1, color: line),
                    Expanded(
                      child: ListView.builder(
                        itemCount: links.length,
                        itemBuilder: (context, i) {
                          final active = activeIndex == i;
                          return GestureDetector(
                            onTap: () => onLinkTap(i),
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.lg,
                                vertical: AppSpacing.md,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: active
                                        ? AppColors.accent
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    i.toString().padLeft(2, '0'),
                                    style: t.labelAccent.copyWith(
                                      color: active
                                          ? AppColors.accent
                                          : AppColors.accentDim,
                                    ),
                                  ),
                                  const SizedBox(width: AppSpacing.md),
                                  Text(
                                    links[i],
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
      ),
    );
  }
}
