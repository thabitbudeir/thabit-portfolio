import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';

class CVUtils {
  static String get _cvUrl {
    if (!kIsWeb) {
      return 'assets/Thabit_Budeir_CV.pdf';
    }

    final uri = Uri.base;
    const basePath = '/thabit-portfolio/';

    return '${uri.origin}$basePath'
        'assets/assets/Thabit_Budeir_CV.pdf';
  }

  static Future<void> viewCV() async {
    final Uri uri = Uri.parse(_cvUrl);

    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {}
  }

  static Future<void> downloadCV() async {
    await viewCV();
  }
}
