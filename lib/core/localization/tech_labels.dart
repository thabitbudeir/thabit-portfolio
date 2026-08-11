import 'app_strings.dart';

/// Translates technology/keyword chips when the language changes.
/// Proper nouns (Flutter, Dart, Laravel, Firebase, GetX…) stay as-is.
class TechLabels {
  static const Map<String, String> _en = {
    'Artificial Intelligence': 'الذكاء الاصطناعي',
    'Decision Systems': 'أنظمة اتخاذ القرار',
    'UI/UX': 'تصميم واجهات وتجربة المستخدم',
    'Design Systems': 'أنظمة التصميم',
    'REST APIs': 'واجهات REST API',
    'Product Discovery': 'اكتشاف المنتج',
    'UX Case Study': 'دراسة حالة تجربة المستخدم',
    'Web Design': 'تصميم ويب',
    'Mobile UI/UX': 'تصميم واجهات الجوال',
    'Product Design': 'تصميم المنتج',
    'Web Interface': 'واجهة ويب',
    'Mobile Development': 'تطوير الجوال',
    'BACKEND': 'الخلفية',
    'DATABASES': 'قواعد البيانات',
    'DESIGN': 'التصميم',
    'TOOLS': 'الأدوات',
  };

  /// Returns the localized label for [label], falling back to the original.
  static String of(String label) {
    final ar = _en[label.trim()];
    if (ar == null) return label;
    return AppStrings.isRTL ? ar : label;
  }
}
