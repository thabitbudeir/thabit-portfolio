import '../localization/app_strings.dart';

class LocalizedString {
  final String en;
  final String ar;
  final String de;

  LocalizedString({required this.en, required this.ar, this.de = ''});

  String get value => AppStrings.get(en, ar, de.isEmpty ? en : de);

  @override
  String toString() => value;
}

class Project {
  final LocalizedString title;
  final LocalizedString description;
  final LocalizedString problem;
  final LocalizedString solution;
  final LocalizedString role;
  final List<String> technologies;
  final List<LocalizedString> features;
  final String? githubUrl;
  final String? demoUrl;
  final String imageUrl;

  Project({
    required this.title,
    required this.description,
    required this.problem,
    required this.solution,
    required this.role,
    required this.technologies,
    required this.features,
    this.githubUrl,
    this.demoUrl,
    required this.imageUrl,
  });
}

class Certificate {
  final LocalizedString title;
  final LocalizedString organization;
  final String? duration;
  final String? date;
  final String imageUrl;

  Certificate({
    required this.title,
    required this.organization,
    this.duration,
    this.date,
    required this.imageUrl,
  });
}

class Experience {
  final LocalizedString title;
  final LocalizedString organization;
  final String duration;
  final LocalizedString description;
  final List<String> skills;
  final bool isTraining;

  Experience({
    required this.title,
    required this.organization,
    required this.duration,
    required this.description,
    required this.skills,
    this.isTraining = false,
  });
}

class DesignItem {
  final LocalizedString title;
  final LocalizedString category;
  final String imageUrl;

  DesignItem({
    required this.title,
    required this.category,
    required this.imageUrl,
  });
}

class PortfolioData {
  static final List<Project> projects = [
    Project(
      title: LocalizedString(en: 'AURIX', ar: 'أوريكس'),
      description: LocalizedString(
        en: 'Smart Tender Management System.',
        ar: 'نظام ذكي لإدارة المناقصات.',
      ),
      problem: LocalizedString(
        en: 'Traditional tender management is slow, lacks transparency, and often leads to suboptimal decision-making.',
        ar: 'إدارة المناقصات التقليدية بطيئة، تفتقر إلى الشفافية، وغالباً ما تؤدي إلى اتخاذ قرارات غير مثالية.',
      ),
      solution: LocalizedString(
        en: 'A comprehensive digital platform that streamlines the entire tendering process using advanced algorithms and AI.',
        ar: 'منصة رقمية شاملة تعمل على تبسيط عملية تقديم العطاءات بالكامل باستخدام الخوارزميات المتقدمة والذكاء الاصطناعي.',
      ),
      role: LocalizedString(
        en: 'Lead Flutter Developer & AI Integration',
        ar: 'مطور فلاتر رئيسي ومسؤول دمج الذكاء الاصطناعي',
      ),
      technologies: [
        'Flutter',
        'Dart',
        'GetX',
        'Laravel',
        'PostgreSQL',
        'Firebase',
        'AI',
        'MCDM',
      ],
      features: [
        LocalizedString(
          en: 'Real-time tender tracking',
          ar: 'تتبع المناقصات في الوقت الفعلي',
        ),
        LocalizedString(
          en: 'AI-based evaluation system',
          ar: 'نظام تقييم يعتمد على الذكاء الاصطناعي',
        ),
        LocalizedString(
          en: 'Multi-Criteria Decision Making (MCDM) integration',
          ar: 'تكامل صنع القرار متعدد المعايير (MCDM)',
        ),
        LocalizedString(
          en: 'Secure document management',
          ar: 'إدارة آمنة للمستندات',
        ),
      ],
      imageUrl: 'assets/projects/aurix.jpg',
      githubUrl: 'https://github.com/thabitbudeir/aurix',
    ),
  ];

  static final List<Experience> experiences = [
    Experience(
      title: LocalizedString(
        en: 'Flutter Developer Training',
        ar: 'تدريب مطور فلاتر',
      ),
      organization: LocalizedString(en: 'Tech Academy', ar: 'أكاديمية تيك'),
      duration: '2023 - 2024',
      description: LocalizedString(
        en: 'Intensive training on Flutter framework, state management, and modern mobile architecture.',
        ar: 'تدريب مكثف على إطار عمل فلاتر، وإدارة الحالة، ومعمارية الهاتف المحمول الحديثة.',
      ),
      skills: ['Flutter', 'Dart', 'Clean Architecture', 'API Integration'],
      isTraining: true,
    ),
    Experience(
      title: LocalizedString(
        en: 'AI Engineering Student',
        ar: 'طالب هندسة ذكاء اصطناعي',
      ),
      organization: LocalizedString(
        en: 'Al-Sham Private University',
        ar: 'جامعة الشام الخاصة',
      ),
      duration: '2021 - Present',
      description: LocalizedString(
        en: 'Focusing on Informatics Engineering with a specialization in Artificial Intelligence.',
        ar: 'التركيز على هندسة المعلوماتية مع تخصص في الذكاء الاصطناعي.',
      ),
      skills: ['Python', 'Machine Learning', 'Neural Networks', 'Data Science'],
    ),
  ];

  static final List<Certificate> certificates = [
    Certificate(
      title: LocalizedString(
        en: 'Mobile App Programming using Flutter',
        ar: 'برمجة تطبيقات الهاتف المحمول باستخدام فلاتر',
      ),
      organization: LocalizedString(en: 'Tech Academy', ar: 'أكاديمية تيك'),
      imageUrl: 'assets/certificates/flutter.jpg',
    ),
    Certificate(
      title: LocalizedString(
        en: 'UI/UX Design Specialization',
        ar: 'تخصص تصميم واجهة وتجربة المستخدم',
      ),
      organization: LocalizedString(en: 'Design Institute', ar: 'معهد التصميم'),
      imageUrl: 'assets/certificates/uiux.jpg',
    ),
  ];

  static final List<DesignItem> designs = [
    DesignItem(
      title: LocalizedString(en: 'Fintech Dashboard', ar: 'لوحة تحكم مالية'),
      category: LocalizedString(en: 'Web Design', ar: 'تصميم ويب'),
      imageUrl: 'assets/designs/fintech.jpg',
    ),
  ];

  static const List<String> mobileSkills = [
    'Flutter',
    'Dart',
    'GetX',
    'REST APIs',
    'Dio',
  ];
  static const List<String> backendSkills = [
    'Laravel',
    'PostgreSQL',
    'Firebase',
  ];
  static const List<String> aiSkills = [
    'Artificial Intelligence',
    'RAG',
    'OCR',
    'Decision systems',
  ];
  static const List<String> designSkills = ['UI/UX', 'Figma', 'Design systems'];
  static const List<String> toolSkills = ['Git', 'GitHub', 'VS Code'];
}
