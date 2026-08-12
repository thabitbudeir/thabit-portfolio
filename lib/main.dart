import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/typography.dart';
import 'core/localization/app_strings.dart';
import 'pages/home/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isDark = prefs.getBool('isDark') ?? true;

  // Restore the last UI language.
  final langName = prefs.getString('lang') ?? AppStrings.currentLanguage.name;
  AppStrings.setLanguage(
    AppLanguage.values.firstWhere(
      (l) => l.name == langName,
      orElse: () => AppStrings.currentLanguage,
    ),
  );

  runApp(PortfolioApp(initialIsDark: isDark));
}

class PortfolioApp extends StatefulWidget {
  final bool initialIsDark;
  const PortfolioApp({super.key, required this.initialIsDark});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  late bool _isDark;

  @override
  void initState() {
    super.initState();
    _isDark = widget.initialIsDark;
  }

  Future<void> _updateTheme(bool isDark) async {
    setState(() => _isDark = isDark);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);
  }

  Future<void> _updateLanguage(AppLanguage lang) async {
    setState(() {
      AppStrings.setLanguage(lang);
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', lang.name);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thabit Budeir | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      builder: (context, child) {
        return AppTextScope(
          isDark: _isDark,
          child: Directionality(
            textDirection: AppStrings.isRTL
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: child ?? const SizedBox.shrink(),
          ),
        );
      },
      home: HomePage(
        onLanguageChanged: _updateLanguage,
        onThemeChanged: _updateTheme,
      ),
    );
  }
}
