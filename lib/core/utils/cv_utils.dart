import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class CVUtils {
  /// بناء الرابط المطلق للملف بشكل ديناميكي لتجاوز مشاكل المسارات في الويب
  static String get _cvUrl {
    if (!kIsWeb) return 'assets/Thabit_Budeir_CV.pdf';

    // Build an absolute URL based on the current origin + base path.
    // Example: https://thabitbudeir.github.io/thabit-portfolio/
    // Flutter Web serves bundled assets at the root of the base href,
    // NOT under an extra assets/assets/ prefix.
    final String origin = Uri.base.origin;
    final String path = Uri.base.path;
    final String normalizedPath = path.endsWith('/') ? path : '$path/';
    return '$origin${normalizedPath}assets/Thabit_Budeir_CV.pdf';
  }

  static Future<void> viewCV() async {
    final String url = _cvUrl;
    final Uri uri = Uri.parse(url);

    try {
      // Open the file in a new tab outside the app
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      // Final fallback with a relative path in case the absolute URL fails
      try {
        await launchUrl(
          Uri.parse('assets/Thabit_Budeir_CV.pdf'),
          mode: LaunchMode.externalApplication,
        );
      } catch (_) {}
    }
  }

  static Future<void> downloadCV() async {
    // فتح الملف في المتصفح هو الطريقة الأكثر استقراراً
    // حيث تتيح جميع المتصفحات زر "تحميل" (Download) بشكل مدمج.
    await viewCV();
  }
}
