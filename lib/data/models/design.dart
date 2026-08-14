import '../../core/localization/localized_string.dart';

class Design {
  final String id;
  final LocalizedString title;
  final LocalizedString category;
  final String imageUrl;
  final bool isLarge;
  final String? behanceUrl;

  Design({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    this.isLarge = false,
    this.behanceUrl,
  });
}

class DesignData {
  static List<Design> get designs => [
    Design(
      id: 'aurix-design',
      title: const LocalizedString(
        en: 'AURIX - Smart Tender System',
        ar: 'أوريكس - نظام المناقصات الذكي',
      ),
      category: const LocalizedString(en: 'Product Design', ar: 'تصميم المنتج'),
      imageUrl: 'assets/designs/AURIX/1.png',
      isLarge: true,
      behanceUrl: 'https://www.behance.net/thabitbudeir1',
    ),
    Design(
      id: 'nabdh-design',
      title: const LocalizedString(
        en: 'NABDH - Shopping App',
        ar: 'نبض - تطبيق تسوق',
      ),
      category: const LocalizedString(
        en: 'Mobile UI/UX',
        ar: 'تصميم واجهات الجوال',
      ),
      imageUrl: 'assets/designs/NABDH/1.png',
      behanceUrl: 'https://www.behance.net/thabitbudeir1',
    ),
    Design(
      id: 'fodoora-design',
      title: const LocalizedString(
        en: 'Fodoora - Restaurant App',
        ar: 'فدورة - تطبيق مطاعم',
      ),
      category: const LocalizedString(
        en: 'UX Case Study',
        ar: 'دراسة حالة تجربة المستخدم',
      ),
      imageUrl: 'assets/designs/Fodoora/fodoora.png',
      behanceUrl: 'https://www.behance.net/thabitbudeir1',
    ),
    Design(
      id: 'dashboard-ui',
      title: const LocalizedString(
        en: 'Enterprise Dashboard',
        ar: 'لوحة تحكم مؤسسية',
      ),
      category: const LocalizedString(en: 'Web Interface', ar: 'واجهة ويب'),
      imageUrl: 'assets/designs/Dashboard UI/1.png',
      behanceUrl: 'https://www.behance.net/thabitbudeir1',
    ),
  ];
}
