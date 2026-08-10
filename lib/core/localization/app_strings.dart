enum AppLanguage { en, ar, de }

class AppStrings {
  static AppLanguage _currentLanguage = AppLanguage.en;
  static AppLanguage get currentLanguage => _currentLanguage;
  static bool get isRTL => _currentLanguage == AppLanguage.ar;

  static void setLanguage(AppLanguage lang) {
    _currentLanguage = lang;
  }

  static String get(String en, String ar, String de) {
    switch (_currentLanguage) {
      case AppLanguage.en:
        return en;
      case AppLanguage.ar:
        return ar;
      case AppLanguage.de:
        return de;
    }
  }

  // Navigation
  static String get navHome => get('Home', 'الرئيسية', 'Start');
  static String get navWhatIDo =>
      get('What I Do', 'ماذا أقدّم', 'Was ich mache');
  static String get navAbout => get('About', 'من أنا', 'Über mich');
  static String get navCurrent =>
      get('Current Work', 'ما أعمل عليه الآن', 'Aktuelle Arbeit');
  static String get navProjects => get('Projects', 'المشاريع', 'Projekte');
  static String get navSkills => get('Skills', 'المهارات', 'Fähigkeiten');
  static String get navDesigns => get('Designs', 'التصاميم', 'Designs');
  static String get navCertificates =>
      get('Certificates', 'الشهادات', 'Zertifikate');
  static String get navExperience => get('Experience', 'الخبرة', 'Erfahrung');
  static String get navContact => get('Contact', 'تواصل', 'Kontakt');

  // Hero
  static String get heroEyebrow => get(
    'THABIT BUDEIR  ·  FLUTTER  ·  MOBILE  ·  AI  ·  UI/UX',
    'ثابت بدير  ·  Flutter  ·  موبايل  ·  ذكاء اصطناعي  ·  UI/UX',
    'THABIT BUDEIR  ·  FLUTTER  ·  MOBILE  ·  KI  ·  UI/UX',
  );
  static String get heroName =>
      get('THABIT BUDEIR', 'ثابت بدير', 'THABIT BUDEIR');
  static String get heroLine1 => get(
    'Mobile products',
    'منتجات موبايل',
    'Mobile Produkte',
  );
  static String get heroLine2Prefix => get(
    'built with ',
    'مبنية بـ ',
    'gebaut mit ',
  );
  static String get heroLine2Accent => get(
    'intent.',
    'نية.',
    'Absicht.',
  );
  static String get heroTitle => get(
    'I build modern software products with engineering discipline and design sensitivity.',
    'أبني منتجات برمجية حديثة بانضباط هندسي وحس تصميمي.',
    'Ich entwickle moderne Softwareprodukte mit technischer Disziplin und Designgefühl.',
  );
  static String get heroSub => get(
    'Flutter Web portfolio focused on technical depth, intelligent systems, and premium user experience.',
    'ملف أعمال Flutter Web يركّز على العمق التقني والأنظمة الذكية وتجربة استخدام احترافية.',
    'Flutter-Web-Portfolio mit Fokus auf technischer Tiefe, intelligenten Systemen und hochwertiger UX.',
  );
  static String get viewProjects =>
      get('VIEW PROJECTS', 'عرض المشاريع', 'PROJEKTE ANSEHEN');
  static String get contactMe => get('CONTACT ME', 'تواصل معي', 'KONTAKT');

  // Section labels
  static String get sectionWhatIDo =>
      get('01 — WHAT I DO', '01 — ماذا أقدّم', '01 — WAS ICH MACHE');
  static String get sectionAbout =>
      get('02 — ABOUT', '02 — من أنا', '02 — ÜBER MICH');
  static String get sectionCurrent => get(
    '03 — WHAT I\'M BUILDING NOW',
    '03 — ما أبنيه الآن',
    '03 — WORAN ICH JETZT ARBEITE',
  );
  static String get sectionProjects => get(
    '04 — SELECTED PROJECTS',
    '04 — مشاريع مختارة',
    '04 — AUSGEWÄHLTE PROJEKTE',
  );
  static String get sectionSkills =>
      get('05 — SKILLS', '05 — المهارات', '05 — FÄHIGKEITEN');
  static String get sectionDesigns =>
      get('06 — UI/UX DESIGNS', '06 — تصاميم UI/UX', '06 — UI/UX-DESIGNS');
  static String get sectionCertificates =>
      get('07 — CERTIFICATES', '07 — الشهادات', '07 — ZERTIFIKATE');
  static String get sectionExperience =>
      get('08 — EXPERIENCE', '08 — الخبرة', '08 — ERFAHRUNG');
  static String get sectionContact =>
      get('09 — CONTACT', '09 — تواصل', '09 — KONTAKT');

  // What I do
  static String get whatIDoHeadline => get(
    'Focused domains where I design, build, and optimize real products.',
    'مجالات أركز فيها على التصميم والبناء والتحسين لمنتجات حقيقية.',
    'Kernbereiche, in denen ich reale Produkte gestalte, entwickle und optimiere.',
  );
  static String get domainInformatics => get(
    'Informatics Engineering',
    'هندسة المعلوماتية',
    'Informatikingenieurwesen',
  );
  static String get domainSoftware =>
      get('Software Development', 'تطوير البرمجيات', 'Softwareentwicklung');
  static String get domainAI => get(
    'Artificial Intelligence',
    'الذكاء الاصطناعي',
    'Künstliche Intelligenz',
  );
  static String get domainDesign =>
      get('UI/UX Design', 'تصميم UI/UX', 'UI/UX-Design');

  // About
  static String get aboutHeadline => get(
    'Engineer, builder, and design-minded problem solver.',
    'مهندس ومطوّر يهتم بالحلول والتصميم معاً.',
    'Ingenieur, Builder und designorientierter Problemlöser.',
  );
  static String get aboutP1 => get(
    'I am an Informatics Engineering student specializing in Artificial Intelligence at Al-Sham Private University.',
    'أنا طالب هندسة معلوماتية متخصص في الذكاء الاصطناعي في جامعة الشام الخاصة.',
    'Ich bin Informatikstudent mit Spezialisierung auf Künstliche Intelligenz an der Al-Sham Private University.',
  );
  static String get aboutP2 => get(
    'I build mobile and web software, with strong attention to architecture, interaction quality, and measurable product outcomes.',
    'أبني برمجيات ويب وموبايل مع اهتمام قوي بالمعمارية وجودة التفاعل ونتائج المنتج القابلة للقياس.',
    'Ich entwickle Mobile- und Web-Software mit starkem Fokus auf Architektur, Interaktionsqualität und messbare Ergebnisse.',
  );
  static String get aboutP3 => get(
    'My current focus combines Flutter engineering, AI-assisted workflows, and UI systems that scale.',
    'تركيزي الحالي يجمع بين هندسة Flutter وسير العمل المدعوم بالذكاء الاصطناعي وأنظمة واجهات قابلة للتوسع.',
    'Mein aktueller Fokus verbindet Flutter-Engineering, KI-gestützte Workflows und skalierbare UI-Systeme.',
  );

  // Current work
  static String get currentHeadline => get(
    'Currently Working On',
    'أعمل حالياً على',
    'Woran ich aktuell arbeite',
  );
  static String get statusInDev =>
      get('In Development', 'قيد التطوير', 'In Entwicklung');
  static String get progressLabel =>
      get('Progress', 'نسبة الإنجاز', 'Fortschritt');
  static String get currentFocus =>
      get('Current Focus', 'التركيز الحالي', 'Aktueller Fokus');

  // Agile
  static String get stagePlanning => get('Planning', 'التخطيط', 'Planung');
  static String get stageDesign => get('Design', 'التصميم', 'Design');
  static String get stageDevelopment =>
      get('Development', 'التطوير', 'Entwicklung');
  static String get stageTesting => get('Testing', 'الاختبار', 'Testing');
  static String get stageDeployment =>
      get('Deployment', 'الإطلاق', 'Deployment');
  static String get currentStage =>
      get('Current Stage', 'المرحلة الحالية', 'Aktuelle Phase');

  // Generic
  static String get viewProject =>
      get('VIEW PROJECT →', 'عرض المشروع ←', 'PROJEKT ANSEHEN →');
  static String get viewDesign =>
      get('VIEW DESIGN →', 'عرض التصميم ←', 'DESIGN ANSEHEN →');
  static String get viewCertificate =>
      get('VIEW CERTIFICATE', 'عرض الشهادة', 'ZERTIFIKAT ANSEHEN');
  static String get unavailableImage =>
      get('Image not available', 'الصورة غير متوفرة', 'Bild nicht verfügbar');
  static String get exploreMore =>
      get('Explore More', 'استكشاف المزيد', 'Mehr entdecken');

  // Contact
  static String get contactHeadline => get(
    "Let's build something useful.",
    'لنَبْنِ شيئاً مفيداً.',
    'Lass uns etwas Nützliches bauen.',
  );
  static String get contactBody => get(
    'Open to product engineering, AI-focused systems, and UI/UX collaborations.',
    'متاح للتعاون في هندسة المنتجات والأنظمة المعتمدة على الذكاء الاصطناعي وتجارب UI/UX.',
    'Offen für Produktentwicklung, KI-orientierte Systeme und UI/UX-Kollaborationen.',
  );
  static String get sayHello => get('SAY HELLO', 'قل مرحباً', 'SAG HALLO');
  static String get email => get('Email', 'البريد الإلكتروني', 'E-Mail');
  static String get linkedin => get('LinkedIn', 'لينكدإن', 'LinkedIn');
  static String get github => get('GitHub', 'GitHub', 'GitHub');
  static String get behance => get('Behance', 'Behance', 'Behance');
}
