import '../../core/localization/localized_string.dart';

class Project {
  final String id;
  final String number;
  final LocalizedString name;
  final LocalizedString description;
  final LocalizedString longDescription;
  final String technologies;
  final LocalizedString role;
  final LocalizedString problem;
  final LocalizedString solution;
  final LocalizedString? architectureDesc;
  final LocalizedString keyFeatures;
  final LocalizedString challenges;
  final LocalizedString learnings;
  final LocalizedString? security;
  final LocalizedString? performance;
  final LocalizedString? aiIntegration;
  final String imageUrl;
  final List<String>? galleryImages;
  final String? githubUrl;
  final String? demoUrl;

  Project({
    required this.id,
    required this.number,
    required this.name,
    required this.description,
    required this.longDescription,
    required this.technologies,
    required this.role,
    required this.problem,
    required this.solution,
    this.architectureDesc,
    required this.keyFeatures,
    required this.challenges,
    required this.learnings,
    this.security,
    this.performance,
    this.aiIntegration,
    required this.imageUrl,
    this.galleryImages,
    this.githubUrl,
    this.demoUrl,
  });
}

class ProjectData {
  static List<Project> get projects => [
    // ─── 01 · AURIX · FEATURED ───────────────────────────────────────────
    Project(
      id: 'aurix',
      number: '01',
      name: const LocalizedString(en: 'AURIX', ar: 'أوريكس'),
      description: const LocalizedString(
        en: 'Smart Tender Management System',
        ar: 'نظام ذكي لإدارة المناقصات',
      ),
      longDescription: const LocalizedString(
        en: 'A comprehensive tender management system that streamlines the procurement process for organizations. The platform enables efficient creation, submission, and evaluation of tenders with intelligent features.',
        ar: 'نظام شامل لإدارة المناقصات يعمل على تبسيط عملية الشراء في المؤسسات، ويتيح إنشاء وتقديم وتقييم المناقصات بكفاءة عالية وبميزات ذكية.',
      ),
      technologies:
          'Flutter · Laravel · PostgreSQL · AI · MCDM · GetX · Firebase',
      role: const LocalizedString(
        en: 'Lead Flutter Developer & UI Architect',
        ar: 'مطور فلاتر رئيسي ومهندس واجهات المستخدم',
      ),
      problem: const LocalizedString(
        en: 'Organizations faced challenges in managing tenders efficiently, with manual processes leading to delays, errors, and lack of transparency in decision-making.',
        ar: 'واجهت المؤسسات تحديات في إدارة المناقصات بكفاءة، حيث تؤدي العمليات اليدوية إلى تأخير وأخطاء وعدم شفافية في اتخاذ القرار.',
      ),
      solution: const LocalizedString(
        en: 'Built a cross-platform Flutter application integrated with a Laravel backend. The solution implements a multi-role ecosystem where tenders are analyzed and matched using AI and MCDM algorithms.',
        ar: 'تم بناء تطبيق فلاتر متعدد المنصات متكامل مع خادم Laravel، ويعتمد النظام على بيئة متعددة الأدوار حيث تُحلَّل المناقصات وتُطابَق باستخدام خوارزميات الذكاء الاصطناعي وMCDM.',
      ),
      architectureDesc: const LocalizedString(
        en: 'Clean architecture with layered services: presentation (Flutter/GetX), domain, and data (Laravel API + PostgreSQL). AI evaluation module consumed via REST endpoints.',
        ar: 'معمارية نظيفة بطبقات منفصلة: طبقة العرض (Flutter/GetX)، وطبقة المجال، وطبقة البيانات (Laravel API + PostgreSQL)، مع وحدة تقييم بالذكاء الاصطناعي تُستهلك عبر REST.',
      ),
      keyFeatures: const LocalizedString(
        en: '• Smart document upload and parsing\n• AI-based tender matching\n• Multi-Criteria Decision Making (MCDM) evaluation\n• Real-time notifications\n• Multi-role access control\n• Comprehensive reporting dashboard',
        ar: '• رفع وتحليل ذكي للمستندات\n• مطابقة المناقصات بالذكاء الاصطناعي\n• تقييم متعدد المعايير (MCDM)\n• إشعارات فورية\n• تحكم بالصلاحيات متعدد الأدوار\n• لوحة تقارير شاملة',
      ),
      challenges: const LocalizedString(
        en: 'Implementing real-time synchronization across devices and building a responsive RTL UI.',
        ar: 'تنفيذ مزامنة فورية بين الأجهزة وبناء واجهة متجاوبة تدعم اللغة العربية RTL.',
      ),
      learnings: const LocalizedString(
        en: 'Gained deep experience in state management with GetX and AI-assisted decision-making.',
        ar: 'اكتسبت خبرة عميقة في إدارة الحالة باستخدام GetX واتخاذ القرار المدعوم بالذكاء الاصطناعي.',
      ),
      security: const LocalizedString(
        en: 'Role-based access control with token authentication and encrypted document storage.',
        ar: 'تحكم بالوصول قائم على الأدوار مع مصادقة بالرموز وتخزين مشفر للمستندات.',
      ),
      performance: const LocalizedString(
        en: 'Optimized queries with PostgreSQL indexing and lazy-loaded lists for large tender datasets.',
        ar: 'استعلامات محسّنة بفهارس PostgreSQL وقوائم تحميل كسول لمجموعات المناقصات الكبيرة.',
      ),
      aiIntegration: const LocalizedString(
        en: 'MCDM engine ranks tenders by weighted criteria; OCR + NLP parse uploaded documents into structured data.',
        ar: 'محرك MCDM يرتب المناقصات حسب معايير موزونة؛ وتقنية OCR وNLP تحوّل المستندات المرفوعة إلى بيانات منظمة.',
      ),
      imageUrl: 'assets/designs/AURIX/1.png',
      galleryImages: List.generate(
        10,
        (i) => 'assets/designs/AURIX/${i + 1}.png',
      ),
      githubUrl: 'https://github.com/thabitbudeir/aurix',
    ),

    // ─── 02 · Portfolio Website ─────────────────────────────────────────
    Project(
      id: 'portfolio',
      number: '02',
      name: const LocalizedString(
        en: 'Portfolio Website',
        ar: 'موقع البورتفوليو',
      ),
      description: const LocalizedString(
        en: 'A personal portfolio website built with Flutter Web to showcase my software projects, UI/UX work, technical skills, certifications, and professional background through a modern and interactive experience.',
        ar: 'موقع بورتفوليو شخصي مبني باستخدام Flutter Web لعرض مشاريعي البرمجية وأعمال UI/UX ومهاراتي التقنية وشهاداتي وخلفيتي المهنية ضمن تجربة حديثة وتفاعلية.',
      ),
      longDescription: const LocalizedString(
        en: 'This website is a fully responsive Flutter Web application built from scratch. It presents my selected projects, UI/UX designs, certificates, skills, experience, and contact details in a technical editorial style with full EN/AR localization, dark/light themes, and smooth animations.',
        ar: 'هذا الموقع تطبيق Flutter Web متجاوب بالكامل مبني من الصفر، يعرض مشاريعي المختارة وتصاميم UI/UX وشهاداتي ومهاراتي وخبرتي وبيانات التواصل بأسلوب تحريري تقني، مع ترجمة كاملة EN/AR ووضعي داكن/فاتح وحركات سلسة.',
      ),
      technologies: 'Flutter · Dart · GitHub Pages',
      role: const LocalizedString(
        en: 'Flutter Web Developer & Designer',
        ar: 'مطور ويب فلاتر ومصمم',
      ),
      problem: const LocalizedString(
        en: 'A static PDF resume is not enough to present the depth of real work, visual identity, and technical personality.',
        ar: 'السيرة الذاتية الورقية البسيطة لا تكفي لعرض عمق الأعمال الحقيقية والهوية البصرية والشخصية التقنية.',
      ),
      solution: const LocalizedString(
        en: 'Designed and built a fast, responsive Flutter Web portfolio with localized content (EN/AR/DE), interactive project case studies, and a cohesive technical visual system.',
        ar: 'صممت وبنيت بورتفوليو Flutter Web سريع ومتجاوب مع محتوى مترجم (EN/AR/DE)، ودراسات حالة تفاعلية للمشاريع، ونظام بصري تقني متماسك.',
      ),
      architectureDesc: const LocalizedString(
        en: 'Single-page component-based architecture: section widgets, centralized data models, localized strings, and reusable design-system primitives.',
        ar: 'معمارية صفحة واحدة قائمة على المكونات: ويدجت لكل قسم، ونماذج بيانات مركزية، ونصوص مترجمة، ومكونات نظام تصميم قابلة لإعادة الاستخدام.',
      ),
      keyFeatures: const LocalizedString(
        en: '• Full EN/AR/DE localization with RTL support\n• Dark & light themes\n• Interactive project case studies\n• Scroll animations and hover effects\n• Responsive across desktop, tablet, and mobile\n• GitHub Pages deployment',
        ar: '• ترجمة كاملة EN/AR/DE مع دعم RTL\n• وضع داكن ووضع فاتح\n• دراسات حالة تفاعلية للمشاريع\n• حركات تمرير وتأثيرات hover\n• متجاوب مع سطح المكتب والحاسوب اللوحي والجوال\n• نشر على GitHub Pages',
      ),
      challenges: const LocalizedString(
        en: 'Handling RTL layout for all sections while preserving a consistent technical visual identity on every screen size.',
        ar: 'التعامل مع تخطيط RTL لجميع الأقسام مع الحفاظ على هوية بصرية تقنية متسقة على كل مقاسات الشاشات.',
      ),
      learnings: const LocalizedString(
        en: 'Deepened my skills in Flutter Web, responsive layouts, localization architecture, and automated deployment to GitHub Pages.',
        ar: 'طوّرت مهاراتي في Flutter Web والتخطيط المتجاوب ومعمارية الترجمة والنشر الآلي على GitHub Pages.',
      ),
      imageUrl: 'assets/projects/portfolio.png',
      githubUrl: 'https://github.com/thabitbudeir',
      demoUrl: 'https://thabitbudeir.github.io/thabit-portfolio/',
    ),

    // ─── 03 · NABDH · Shopping App ──────────────────────────────────────
    Project(
      id: 'nabdh',
      number: '03',
      name: const LocalizedString(en: 'NABDH', ar: 'نبض'),
      description: const LocalizedString(
        en: 'Modern Shopping & E-commerce App',
        ar: 'تطبيق تسوق وتجارة إلكترونية حديث',
      ),
      longDescription: const LocalizedString(
        en: 'Nabdh is a complete shopping application designed for a smooth and enjoyable e-commerce experience. The app covers the full shopping journey — browsing products, viewing details, cart management, and a clean checkout flow — with a user-friendly UI.',
        ar: 'نبض تطبيق تسوق متكامل مصمم لتجربة تجارة إلكترونية سلسة وممتعة. يغطي التطبيق رحلة التسوق الكاملة — تصفح المنتجات، عرض التفاصيل، إدارة السلة، وتدفق إتمام الطلب — بواجهة سهلة الاستخدام.',
      ),
      technologies: 'Flutter · Dart · Firebase · REST APIs · UI/UX',
      role: const LocalizedString(
        en: 'Mobile App Developer & Designer',
        ar: 'مطور تطبيق جوال ومصمم',
      ),
      problem: const LocalizedString(
        en: 'Shopping apps often suffer from complicated flows, slow product browsing, and unclear checkout steps.',
        ar: 'غالباً ما تعاني تطبيقات التسوق من تدفقات معقدة وتصفح بطيء للمنتجات وخطوات إتمام طلب غير واضحة.',
      ),
      solution: const LocalizedString(
        en: 'Built a clean, visually appealing shopping app focused on fast browsing, clear product details, and an effortless cart-to-checkout experience.',
        ar: 'تم بناء تطبيق تسوق نظيف وجذاب بصرياً يركّز على التصفح السريع ووضوح تفاصيل المنتج وتجربة سهلة من السلة حتى إتمام الطلب.',
      ),
      architectureDesc: const LocalizedString(
        en: 'Feature-based structure with reusable product components, state management for the cart, and REST API integration for product data.',
        ar: 'بنية قائمة على الميزات مع مكونات منتجات قابلة لإعادة الاستخدام، وإدارة حالة للسلة، وربط بواجهات REST API لبيانات المنتجات.',
      ),
      keyFeatures: const LocalizedString(
        en: '• Product catalog with search & categories\n• Product details screen\n• Shopping cart management\n• Checkout flow\n• RTL-friendly interface',
        ar: '• كتالوج منتجات مع بحث وتصنيفات\n• شاشة تفاصيل المنتج\n• إدارة سلة التسوق\n• تدفق إتمام الطلب\n• واجهة تدعم العربية RTL',
      ),
      challenges: const LocalizedString(
        en: 'Creating an intuitive and consistent shopping flow for a wide range of users.',
        ar: 'إنشاء تدفق تسوق بديهي ومتسق يناسب شريحة واسعة من المستخدمين.',
      ),
      learnings: const LocalizedString(
        en: 'Mastered the balance between rich product data and a simple, focused UI.',
        ar: 'أتقنت الموازنة بين بيانات المنتج الغنية وواجهة بسيطة ومركّزة.',
      ),
      imageUrl: 'assets/designs/NABDH/1.png',
      galleryImages: List.generate(
        9,
        (i) => 'assets/designs/NABDH/${i + 1}.png',
      ),
      githubUrl: 'https://github.com/thabitbudeir',
    ),

    // ─── 04 · Enterprise Dashboard ──────────────────────────────────────
    Project(
      id: 'dashboard',
      number: '04',
      name: const LocalizedString(
        en: 'Enterprise Dashboard',
        ar: 'لوحة تحكم مؤسسية',
      ),
      description: const LocalizedString(
        en: 'Advanced Data Visualization System',
        ar: 'نظام متقدم لتصور البيانات',
      ),
      longDescription: const LocalizedString(
        en: 'A professional management dashboard designed for enterprise resource planning and real-time data monitoring.',
        ar: 'لوحة تحكم إدارية احترافية مصممة لتخطيط موارد المؤسسات ومراقبة البيانات لحظياً.',
      ),
      technologies: 'Flutter Web · Dashboard UI · Charts · Data Analytics',
      role: const LocalizedString(
        en: 'Frontend Architect',
        ar: 'مهندس الواجهات الأمامية',
      ),
      problem: const LocalizedString(
        en: 'Complex data management without clear visualization tools.',
        ar: 'إدارة بيانات معقدة دون أدوات تصور واضحة.',
      ),
      solution: const LocalizedString(
        en: 'Designed and implemented a responsive web dashboard with interactive charts and metrics.',
        ar: 'تم تصميم وتنفيذ لوحة تحكم ويب متجاوبة مع رسوم بيانية تفاعلية ومؤشرات أداء.',
      ),
      keyFeatures: const LocalizedString(
        en: '• Real-time analytics\n• Interactive data charts\n• Resource management\n• User activity tracking',
        ar: '• تحليلات لحظية\n• رسوم بيانية تفاعلية\n• إدارة الموارد\n• تتبع نشاط المستخدمين',
      ),
      challenges: const LocalizedString(
        en: 'Optimizing performance for high-frequency data updates.',
        ar: 'تحسين الأداء لتحديثات البيانات عالية التكرار.',
      ),
      learnings: const LocalizedString(
        en: 'Advanced techniques in Flutter Web optimization.',
        ar: 'تقنيات متقدمة في تحسين أداء Flutter Web.',
      ),
      imageUrl: 'assets/designs/Dashboard UI/1.png',
      galleryImages: List.generate(
        8,
        (i) => 'assets/designs/Dashboard UI/${i + 1}.png',
      ),
    ),

    // ─── 05 · Fodoora ───────────────────────────────────────────────────
    Project(
      id: 'fodoora',
      number: '05',
      name: const LocalizedString(en: 'Fodoora', ar: 'فدورة'),
      description: const LocalizedString(
        en: 'Premium Food Delivery Concept',
        ar: 'مفهوم توصيل طعام متميز',
      ),
      longDescription: const LocalizedString(
        en: 'A complete UX case study for a modern food delivery application focusing on user journey and visual identity.',
        ar: 'دراسة حالة UX كاملة لتطبيق توصيل طعام حديث تركز على رحلة المستخدم والهوية البصرية.',
      ),
      technologies: 'UX Design · Figma · Product Discovery',
      role: const LocalizedString(
        en: 'UX/UI Designer',
        ar: 'مصمم تجربة وواجهة المستخدم',
      ),
      problem: const LocalizedString(
        en: 'High friction in standard food ordering flows.',
        ar: 'احتكاك عالٍ في تدفقات طلب الطعام التقليدية.',
      ),
      solution: const LocalizedString(
        en: 'Redesigned the entire ordering experience to focus on speed and visual appeal.',
        ar: 'أعدت تصميم تجربة الطلب بالكامل للتركيز على السرعة والجاذبية البصرية.',
      ),
      keyFeatures: const LocalizedString(
        en: '• Optimized checkout flow\n• Visual restaurant discovery\n• Real-time order tracking UI',
        ar: '• تدفق إتمام طلب محسّن\n• اكتشاف بصري للمطاعم\n• واجهة تتبع الطلب لحظياً',
      ),
      challenges: const LocalizedString(
        en: 'Maintaining brand consistency across multiple flows.',
        ar: 'الحفاظ على اتساق الهوية عبر تدفقات متعددة.',
      ),
      learnings: const LocalizedString(
        en: 'Deep dive into user psychology during ordering processes.',
        ar: 'دراسة متعمقة لعلم نفس المستخدم أثناء عمليات الطلب.',
      ),
      imageUrl: 'assets/designs/Fodoora/fodoora.png',
      galleryImages: ['assets/designs/Fodoora/fodoora.png'],
    ),
  ];
}
