import 'package:flutter/material.dart';
import '../../core/localization/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/design_system.dart';
import '../../core/theme/typography.dart';
import '../../core/widgets/background_system.dart';
import '../../core/widgets/navigation.dart';
import 'widgets/about_section.dart';
import 'widgets/certificates_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/current_work_section.dart';
import 'widgets/designs_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/skills_section.dart';
import 'widgets/what_i_do_section.dart';
import 'widgets/lab_section.dart';

class HomePage extends StatefulWidget {
  final Function(AppLanguage) onLanguageChanged;
  final Function(bool) onThemeChanged;

  const HomePage({
    super.key,
    required this.onLanguageChanged,
    required this.onThemeChanged,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(11, (_) => GlobalKey());
  final ValueNotifier<double> _scrollOffset = ValueNotifier(0);
  int _activeSectionIndex = 0;
  DateTime _lastScrollCall = DateTime.now();
  bool _recruiterMode = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _scrollOffset.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final offset = _scrollController.offset;
    _scrollOffset.value = offset;

    final now = DateTime.now();
    if (now.difference(_lastScrollCall).inMilliseconds < 100) return;
    _lastScrollCall = now;

    const navHeight = AppLayout.navHeight;
    int? newActive;
    for (int i = 0; i < _sectionKeys.length; i++) {
      final ctx = _sectionKeys[i].currentContext;
      if (ctx == null) continue;
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null || !box.attached) continue;
      final position = box.localToGlobal(Offset.zero);
      final height = box.size.height;
      if (position.dy <= navHeight + 100 && position.dy + height > navHeight) {
        newActive = i;
        break;
      }
    }

    if (newActive != null && newActive != _activeSectionIndex) {
      setState(() => _activeSectionIndex = newActive!);
    }
  }

  void _scrollToSection(int index) {
    final ctx = _sectionKeys[index].currentContext;
    if (ctx == null) return;
    final box = ctx.findRenderObject() as RenderBox?;
    if (box == null || !box.attached) return;

    const navHeight = AppLayout.navHeight;
    final position = box.localToGlobal(Offset.zero);
    final targetOffset = (_scrollOffset.value + position.dy - navHeight).clamp(
      0.0,
      _scrollController.position.maxScrollExtent,
    );

    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: BackgroundSystem(child: SizedBox.expand()),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  const SizedBox(height: AppLayout.navHeight),
                  _SectionWrapper(
                    key: _sectionKeys[0],
                    child: HeroSection(
                      onViewProjects: () => _scrollToSection(4),
                      onContact: () => _scrollToSection(9),
                    ),
                  ),
                  if (!_recruiterMode)
                    _SectionWrapper(
                      key: _sectionKeys[1],
                      child: WhatIDoSection(),
                    ),
                  _SectionWrapper(key: _sectionKeys[2], child: AboutSection()),
                  if (!_recruiterMode)
                    _SectionWrapper(
                      key: _sectionKeys[3],
                      child: CurrentWorkSection(),
                    ),
                  _SectionWrapper(
                    key: _sectionKeys[4],
                    child: ProjectsSection(),
                  ),
                  _SectionWrapper(key: _sectionKeys[5], child: SkillsSection()),
                  if (!_recruiterMode)
                    _SectionWrapper(
                      key: _sectionKeys[6],
                      child: DesignsSection(),
                    ),
                  if (!_recruiterMode)
                    _SectionWrapper(
                      key: _sectionKeys[7],
                      child: CertificatesSection(),
                    ),
                  _SectionWrapper(
                    key: _sectionKeys[8],
                    child: ExperienceSection(),
                  ),
                  if (!_recruiterMode)
                    _SectionWrapper(key: _sectionKeys[10], child: LabSection()),
                  _SectionWrapper(
                    key: _sectionKeys[9],
                    child: ContactSection(),
                  ),
                  _Footer(isDark: isDark),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ValueListenableBuilder<double>(
              valueListenable: _scrollOffset,
              builder: (context, offset, _) {
                return AppNavigation(
                  activeSectionIndex: _activeSectionIndex,
                  scrollOffset: offset,
                  onSectionTapped: _scrollToSection,
                  onLanguageChanged: (lang) {
                    widget.onLanguageChanged(lang);
                    setState(() {});
                  },
                  onThemeChanged: widget.onThemeChanged,
                  recruiterMode: _recruiterMode,
                  onRecruiterModeChanged: (v) =>
                      setState(() => _recruiterMode = v),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionWrapper extends StatelessWidget {
  final Widget child;
  const _SectionWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(child: child);
  }
}

class _Footer extends StatelessWidget {
  final bool isDark;
  const _Footer({required this.isDark});

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    final line = isDark ? AppColors.darkLine : AppColors.lightLine;
    final year = DateTime.now().year;
    return RepaintBoundary(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.xxl,
          horizontal: AppLayout.sectionPadDesktop,
        ),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: line, width: 1)),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: AppLayout.maxWidth),
            child: Column(
              children: [
                const SizedBox(height: AppSpacing.lg),
                Text(
                  AppStrings.footerTagline,
                  style: t.label,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  '© $year  Thabit Budeir  —  ${AppStrings.allRightsReserved}',
                  style: t.monoBodySm,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
