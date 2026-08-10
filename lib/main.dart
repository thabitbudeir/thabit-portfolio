import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/typography.dart';
import 'core/localization/app_strings.dart';
import 'pages/home/home_page.dart';

Future<void> main() async {
  // Pre-initialize for immediate startup performance
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isDark = prefs.getBool('isDark') ?? true;
  
  // Set initial language if saved (optional improvement)
  // AppStrings.setLanguage(...);

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

  void _updateLanguage(AppLanguage lang) {
    setState(() {
      AppStrings.setLanguage(lang);
    });
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
      // Optimization: Removed the ValueKey that was causing full page destruction
      home: HomePage(
        onLanguageChanged: _updateLanguage,
        onThemeChanged: _updateTheme,
      ),
    );
  }
}
