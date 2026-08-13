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
  static String get navLab => get('Lab', 'المختبر', 'Labor');


  static String get menuOpen => get('Open menu', 'فتح القائمة', 'Menü öffnen');
  static String get menuClose =>
      get('Close menu', 'إغلاق القائمة', 'Menü schließen');
  static String get goToHome =>
      get('Go to home', 'الذهاب للرئيسية', 'Zur Startseite');
  static String get closePreview =>
      get('Close preview', 'إغلاق المعاينة', 'Vorschau schließen');

  // Hero
  static String get heroEyebrow => get(
    'Thabit Budeir  ·  Flutter Developer & AI Engineer',
    'ثابت بدير  ·  مطور Flutter ومهندس ذكاء اصطناعي',
    'Thabit Budeir  ·  Flutter-Entwickler & KI-Ingenieur',
  );
  static String get heroName =>
      get('Thabit Budeir', 'ثابت بدير', 'Thabit Budeir');
  static String get heroLine1 =>
      get('I design, build,', 'أصمّم، أبني،', 'Ich entwerfe, baue');
  static String get heroLine2Prefix =>
      get('and ship ', 'وأنشر ', 'und veröffentliche ');
  static String get heroLine2Accent =>
      get('digital products.', 'منتجات رقمية.', 'digitale Produkte.');
  static String get heroTitle => get(
    'Flutter developer & AI engineering student — building mobile apps, intelligent systems, and interfaces designed to be useful, not just impressive.',
    'مطوّر Flutter وطالب هندسة ذكاء اصطناعي — أبني تطبيقات الجوال والأنظمة الذكية والواجهات المصمَّمة لتكون مفيدة، لا مبهرة فقط.',
    'Flutter-Entwickler & KI-Informatikstudent — ich baue Mobile-Apps, intelligente Systeme und Interfaces, die nützlich sind, nicht nur beeindruckend.',
  );
  static String get heroSub => get(
    'A Flutter Web portfolio of selected projects, intelligent systems, and design work.',
    'بورتفوليو Flutter Web يعرض مشاريع مختارة وأنظمة ذكية وأعمال تصميم.',
    'Ein Flutter-Web-Portfolio mit ausgewählten Projekten, intelligenten Systemen und Designarbeiten.',
  );
  static String get viewProjects =>
      get('View Projects', 'استعرض المشاريع', 'PROJEKTE ANSEHEN');
  static String get viewWork =>
      get('View Projects', 'استعرض المشاريع', 'PROJEKTE ANSEHEN');
  static String get contactMe => get('CONTACT ME', 'تواصل معي', 'KONTAKT');
  static String get downloadCv =>
      get('Download CV', 'تحميل السيرة الذاتية', 'CV HERUNTERLADEN');
  static String get viewCv =>
      get('View CV', 'عرض السيرة الذاتية', 'CV ANSEHEN');
  static String get statusLabel => get('STATUS', 'الحالة', 'STATUS');
  static String get statusOpen =>
      get('Open to projects', 'متاح للمشاريع', 'Offen für Projekte');
  static String get focusLabel => get('FOCUS', 'التركيز', 'FOKUS');
  static String get focusValue => get(
    'Flutter · Dart · AI · Laravel · Firebase · REST APIs',
    'Flutter · Dart · الذكاء الاصطناعي · Laravel · Firebase · REST APIs',
    'Flutter · Dart · KI · Laravel · Firebase · REST-APIs',
  );
  static String get basedInLabel => get('BASED IN', 'المقر', 'STANDORT');
  static String get basedInValue =>
      get('Syria · Remote', 'سوريا · عن بُعد', 'Syrien · Remote');


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
  static String get sectionLab => get(
    '10 — TECHNICAL LAB',
    '10 — المختبر التقني',
    '10 — TECHNISCHES LABOR',
  );


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
  static String get domainInformaticsDesc => get(
    'Systems, architecture thinking, and scalable technical foundations.',
    'الأنظمة، التفكير المعماري، والأسس التقنية القابلة للتوسع.',
    'Systeme, Architekturdenken und skalierbare technische Grundlagen.',
  );
  static String get domainSoftware =>
      get('Software Development', 'تطوير البرمجيات', 'Softwareentwicklung');
  static String get domainSoftwareDesc => get(
    'Cross-platform product development with clean implementation quality.',
    'تطوير منتجات متعددة المنصات بجودة تنفيذ نظيفة.',
    'Plattformübergreifende Produktentwicklung mit sauberer Implementierungsqualität.',
  );
  static String get domainAI => get(
    'Artificial Intelligence',
    'الذكاء الاصطناعي',
    'Künstliche Intelligenz',
  );
  static String get domainAIDesc => get(
    'AI-assisted decision flows, document analysis, and smart automation.',
    'تدفقات القرار المدعومة بالذكاء اصطناعي، تحليل المستندات، والأتمتة الذكية.',
    'KI-gestützte Entscheidungsabläufe, Dokumentenanalyse und intelligente Automatisierung.',
  );
  static String get domainDesign =>
      get('UI/UX Design', 'تصميم UI/UX', 'UI/UX-Design');
  static String get domainDesignDesc => get(
    'Interfaces with strong hierarchy, usability, and visual personality.',
    'واجهات ذات تسلسل هرمي قوي، سهولة استخدام، وشخصية بصرية.',
    'Schnittstellen mit starker Hierarchie, Benutzerfreundlichkeit und visueller Persönlichkeit.',
  );


  static String get aboutHeadline => get(
    'Engineer, builder, and design-minded problem solver.',
    'مهندس ومطوّر يهتم بالحلول والتصميم معاً.',
    'Ingenieur, Builder und designorientierter Problemlöser.',
  );
  static String get aboutP1 => get(
    'I’m Thabit Budeir, an Informatics Engineering student specializing in Artificial Intelligence and a Flutter Developer focused on building practical, scalable, and user-centered digital solutions.',
    'أنا ثابت بدير، طالب هندسة معلوماتية باختصاص الذكاء الاصطناعي ومطور تطبيقات Flutter، أركز على بناء حلول رقمية عملية وقابلة للتوسع وتركز على احتياجات المستخدم.',
    'Ich bin Thabit Budeir, Informatikstudent mit Spezialisierung auf Künstliche Intelligenz und Flutter-Entwickler.',
  );
  static String get aboutP2 => get(
    'I work across mobile development, UI/UX, and intelligent systems, with hands-on experience building real-world projects using Flutter, Dart, Laravel, MySQL, PostgreSQL, Firebase, and REST APIs. I enjoy turning complex requirements and ideas into clear, functional, and well-designed digital products.',
    'أعمل في تطوير تطبيقات الهاتف المحمول وتصميم واجهات وتجارب المستخدم، بالإضافة إلى تطوير الأنظمة الذكية، ولدي خبرة عملية في بناء مشاريع باستخدام Flutter وDart وLaravel وMySQL وPostgreSQL وFirebase وواجهات REST API. أهتم بتحويل المتطلبات والأفكار المعقدة إلى منتجات واضحة وعملية وذات تجربة استخدام جيدة.',
    'Ich arbeite in den Bereichen Mobile Development, UI/UX und intelligente Systeme mit praktischer Erfahrung.',
  );
  static String get aboutP3 => get(
    'Beyond development, I have experience working within teams and leading projects from planning and task distribution to implementation and delivery. My goal is to continuously improve my technical skills while building software that solves real problems and creates meaningful value.',
    'كما أمتلك خبرة في العمل ضمن الفرق وقيادة المشاريع، بدءًا من التخطيط وتوزيع المهام ومتابعة التنفيذ وصولًا إلى تسليم المنتج. أعمل باستمرار على تطوير مهاراتي التقنية وبناء حلول برمجية تعالج مشكلات حقيقية وتقدم قيمة ملموسة.',
    'Über die Entwicklung hinaus verfüge ich über Erfahrung in der Teamarbeit und Projektleitung.',
  );
  static String get profileLabel => get('PROFILE', 'الملف الشخصي', 'PROFIL');
  static String get layersLabel => get('LAYERS', 'الطبقات', 'SCHICHTEN');
  static String get statEngineer => get('ENGINEER', 'مهندس', 'INGENIEUR');
  static String get statBuilder => get('BUILDER', 'مطور', 'BUILDER');
  static String get statDesigner => get('DESIGNER', 'مصمم', 'DESIGNER');
  static String get statLanguages => get('LANGUAGES', 'اللغات', 'SPRACHEN');
  static String get thabitSignature =>
      get('— Thabit Budeir', '— ثابت بدير', '— Thabit Budeir');


  static String get currentHeadline => get(
    'Currently Working On',
    'أعمل حالياً على',
    'Woran ich aktuell arbeite',
  );
  static String get currentSub => get(
    'A live look at what is in motion right now.',
    'نظرة مباشرة على ما يتم بناؤه الآن.',
    'Ein aktueller Blick auf laufende Arbeit.',
  );
  static String get statusInDev =>
      get('In Development', 'قيد التطوير', 'In Entwicklung');
  static String get progressLabel =>
      get('Progress', 'نسبة الإنجاز', 'Fortschritt');
  static String get currentFocus =>
      get('Current Focus', 'التركيز الحالي', 'Aktueller Fokus');
  static String get nowTag => get('NOW', 'الآن', 'JETZT');
  static String get buildingLabel => get('Building', 'بناء', 'Bauen');
  static String get learningLabel => get('Learning', 'تعلّم', 'Lernen');
  static String get exploringLabel => get('Exploring', 'استكشاف', 'Erforschen');
  static String get availableForLabel =>
      get('Available for', 'متاح لـ', 'Verfügbar für');

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
  static String get stageLabel => get('STAGE', 'المرحلة', 'PHASE');
  static String get nowLabel => get('// الآن', '// الآن', '// jetzt');


  static String get projectsHeadline =>
      get('Selected projects.', 'مشاريع مختارة.', 'Ausgewählte Projekte.');
  static String get projectsSub => get(
    'Real products, real problems, real systems. Each entry below is a product-shaped body of work, not a screenshot.',
    'منتجات حقيقية، مشاكل حقيقية، أنظمة حقيقية. كل عنصر هنا هو عمل بمنتج متكامل، وليس لقطة شاشة.',
    'Echte Produkte, echte Probleme, echte Systeme. Jeder Eintrag ist produktförmige Arbeit, kein Screenshot.',
  );
  static String get featuredLabel => get('FEATURED', 'مميز', 'HIGHLIGHT');
  static String get projectLabel => get('PROJECT', 'مشروع', 'PROJEKT');
  static String get roleLabel => get('Role', 'الدور', 'Rolle');

  // Case Study
  static String get caseStudyOverview =>
      get('01 — OVERVIEW', '01 — نظرة عامة', '01 — ÜBERSICHT');
  static String get caseStudyProblem =>
      get('02 — THE PROBLEM', '02 — المشكلة', '02 — DAS PROBLEM');
  static String get caseStudySolution =>
      get('03 — THE SOLUTION', '03 — الحل', '03 — DIE LÖSUNG');
  static String get caseStudyMyRole =>
      get('04 — MY ROLE', '04 — دوري', '04 — MEINE ROLLE');
  static String get caseStudyArchitecture =>
      get('05 — ARCHITECTURE', '05 — المعمارية', '05 — ARCHITEKTUR');
  static String get caseStudyFeatures =>
      get('06 — CORE FEATURES', '06 — الميزات الأساسية', '06 — HAUPTMERKMALE');
  static String get caseStudyChallenges => get(
    '07 — TECHNICAL CHALLENGES',
    '07 — التحديات التقنية',
    '07 — TECHNISCHE HERAUSFORDERUNGEN',
  );
  static String get caseStudyAI => get(
    '08 — AI / DECISION ENGINE',
    '08 — الذكاء الاصطناعي / محرك القرار',
    '08 — KI / ENTSCHEIDUNGS-ENGINE',
  );
  static String get caseStudySecurity =>
      get('09 — SECURITY', '09 — الأمان', '09 — SICHERHEIT');
  static String get caseStudyPerformance =>
      get('10 — PERFORMANCE', '10 — الأداء', '10 — PERFORMANCE');
  static String get caseStudyScreens => get(
    '11 — SCREENS / VISUALS',
    '11 — لقطات الشاشة / بصريات',
    '11 — SCREENS / VISUALS',
  );
  static String get caseStudyLinks =>
      get('12 — LINKS', '12 — الروابط', '12 — LINKS');
  static String get viewCaseStudy =>
      get('CASE STUDY', 'دراسة حالة', 'CASE STUDY');
  static String get archInteractiveHint => get(
    'Tap a component to explore technical details',
    'اضغط على مكون لاستكشاف التفاصيل التقنية',
    'Tippen Sie auf eine Komponente, um technische Details zu erkunden',
  );
  static String get archSystemMap => get(
    'INTERACTIVE SYSTEM MAP',
    'خريطة النظام التفاعلية',
    'INTERAKTIVE SYSTEMKARTE',
  );


  static String get labHeadline => get(
    'Experiments & engineering curiosity.',
    'تجارب وفضول هندسي.',
    'Experimente & technische Neugier.',
  );
  static String get labApproach => get('Approach', 'النهج التقني', 'Ansatz');
  static String get labStatus => get('Status', 'الحالة', 'Status');
  static String get labExplore => get('EXPLORE', 'استكشاف', 'ERKUNDEN');
  static String get labResult => get('RESULT', 'النتيجة', 'ERGEBNIS');


  static String get recruiterMode =>
      get('RECRUITER MODE', 'وضع الموظف', 'RECRUITER-MODUS');
  static String get recruiterHint => get(
    'High-impact summary for fast evaluation.',
    'ملخص عالي التأثير للتقييم السريع.',
    'Hocheffektive Zusammenfassung zur schnellen Bewertung.',
  );


  static String get viewResume =>
      get('VIEW RESUME', 'عرض السيرة الذاتية', 'LEBENSLAUF ANSEHEN');
  static String get downloadPdf =>
      get('DOWNLOAD PDF', 'تحميل PDF', 'PDF HERUNTERLADEN');


  static String get skillsHeadline =>
      get('Stack & workflow.', 'المهارات وسير العمل.', 'Stack & Workflow.');
  static String get skillsSub => get(
    'The tools I work with daily, and how I put them together.',
    'الأدوات التي أعمل بها يومياً، وكيف أجمعها معاً.',
    'Die Werkzeuge, mit denen ich täglich arbeite, und wie ich sie verbinde.',
  );


  static String get designsHeadline =>
      get('UI/UX gallery.', 'معرض تصاميم UI/UX.', 'UI/UX-Galerie.');
  static String get designsSub => get(
    'Interface work — product, mobile, and web.',
    'أعمال واجهات — منتجات، موبايل، وويب.',
    'Interface-Arbeit — Produkt, Mobile und Web.',
  );


  static String get certificatesHeadline =>
      get('Certificates.', 'الشهادات.', 'Zertifikate.');
  static String get certificatesSub => get(
    'Formal recognition of completed work and learning.',
    'اعتراف رسمي بأعمال وتعلّم مكتمل.',
    'Formale Anerkennung abgeschlossener Arbeit und Lernens.',
  );


  static String get experienceHeadline =>
      get('Trajectory.', 'المسار المهني.', 'Werdegang.');
  static String get experienceSub => get(
    'Where I have been, what I have been doing, and what it has built.',
    'أين كنت، ماذا فعلت، وما الذي بنيناه.',
    'Wo ich war, was ich getan habe und was es aufgebaut hat.',
  );
  static String get experienceWork => get('Experience', 'الخبرة', 'Erfahrung');
  static String get experienceEdu => get('Education', 'التعليم', 'Ausbildung');
  static String get comingSoon =>
      get('// coming soon', '// قريباً', '// kommt bald');


  static String get closeLabel => get('CLOSE', 'إغلاق', 'SCHLIESSEN');
  static String get githubLabel => get('GITHUB', 'GITHUB', 'GITHUB');
  static String get liveDemoLabel => get('LIVE DEMO', 'عرض حي', 'LIVE-DEMO');
  static String get problemLabel => get('Problem', 'المشكلة', 'Problem');
  static String get solutionLabel => get('Solution', 'الحل', 'Lösung');
  static String get technologiesLabel =>
      get('Technologies', 'التقنيات', 'Technologien');
  static String get featuresLabel =>
      get('Key Features', 'الميزات الرئيسية', 'Hauptmerkmale');


  static String get viewProject =>
      get('View Project →', 'عرض المشروع ←', 'PROJEKT ANSEHEN →');
  static String get viewDesign =>
      get('View Design →', 'عرض التصميم ←', 'DESIGN ANSEHEN →');
  static String get viewCertificate =>
      get('VIEW CERTIFICATE', 'عرض الشهادة', 'ZERTIFIKAT ANSEHEN');
  static String get unavailableImage =>
      get('Image not available', 'الصورة غير متوفرة', 'Bild nicht verfügbar');
  static String get exploreMore =>
      get('Explore More', 'استكشاف المزيد', 'Mehr entdecken');


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
  static String get phone => get('Phone', 'الهاتف', 'Telefon');

  // Footer
  static String get footerTagline => get(
    'INFORMATICS ENGINEER  ·  FLUTTER DEVELOPER  ·  AI ENGINEER',
    'مهندس معلوماتية  ·  مطور Flutter  ·  مهندس ذكاء اصطناعي',
    'INFORMATIKINGENIEUR  ·  FLUTTER-ENTWICKLER  ·  KI-INGENIEUR',
  );
  static String get allRightsReserved => get(
    'All rights reserved.',
    'جميع الحقوق محفوظة.',
    'Alle Rechte vorbehalten.',
  );


  static String get archArchitectureDefault => get(
    'A layered architecture separates presentation, domain, and data concerns for maintainability and testability.',
    'معمارية طبقية تفصل بين العرض والمجال والبيانات لضمان قابلية الصيانة والاختبار.',
    'Eine Schichtenarchitektur trennt Präsentation, Domäne und Daten für Wartbarkeit und Testbarkeit.',
  );
  static String get useCaseLabel =>
      get('USE CASE {n}', 'حالة استخدام {n}', 'ANWENDUNGSFALL {n}');
  static String get screenLabel =>
      get('Screen {n}', 'الشاشة {n}', 'Bildschirm {n}');

  static String get skillMobile =>
      get('MOBILE DEVELOPMENT', 'تطوير الجوال', 'MOBILE-ENTWICKLUNG');
  static String get skillBackend => get('BACKEND', 'الخلفية', 'BACKEND');
  static String get skillDatabases =>
      get('DATABASES', 'قواعد البيانات', 'DATENBANKEN');
  static String get skillAI => get(
    'ARTIFICIAL INTELLIGENCE',
    'الذكاء الاصطناعي',
    'KÜNSTLICHE INTELLIGENZ',
  );
  static String get skillDesign => get('DESIGN', 'التصميم', 'DESIGN');
  static String get skillTools => get('TOOLS', 'الأدوات', 'WERKZEUGE');

  static String get techRestApis =>
      get('REST APIs', 'واجهات REST API', 'REST-APIs');
  static String get techAi => get('AI', 'الذكاء الاصطناعي', 'KI');
  static String get techRag => get('RAG', 'RAG', 'RAG');
  static String get techOcr => get('OCR', 'OCR', 'OCR');
  static String get techDecisionSystems =>
      get('Decision Systems', 'أنظمة اتخاذ القرار', 'Entscheidungssysteme');
  static String get techUiUx =>
      get('UI/UX', 'تصميم واجهات وتجربة المستخدم', 'UI/UX');
  static String get techFigma => get('Figma', 'Figma', 'Figma');
  static String get techDesignSystems =>
      get('Design Systems', 'أنظمة التصميم', 'Designsysteme');
  static String get techCharts => get('Charts', 'الرسوم البيانية', 'Diagramme');
  static String get techDataAnalytics =>
      get('Data Analytics', 'تحليل البيانات', 'Datenanalyse');
  static String get techUxDesign =>
      get('UX Design', 'تصميم تجربة المستخدم', 'UX-Design');
  static String get techProductDiscovery =>
      get('Product Discovery', 'اكتشاف المنتج', 'Produktentdeckung');
  static String get techDashboardUi =>
      get('Dashboard UI', 'واجهة لوحة التحكم', 'Dashboard-UI');

  static String get workTag => get('WORK', 'عمل', 'ARBEIT');
  static String get eduTag => get('EDU', 'تعليم', 'BILDUNG');
  static String get bachelorDegree => get(
    'Bachelor in Informatics Engineering',
    'بكالوريوس هندسة معلوماتية',
    'Bachelor in Informatikingenieurwesen',
  );
  static String get uniSham => get(
    'Al-Sham Private University',
    'جامعة الشام الخاصة',
    'Al-Sham Private University',
  );
  static String get specializationAi => get(
    'Artificial Intelligence',
    'تخصص الذكاء الاصطناعي',
    'Spezialisierung Künstliche Intelligenz',
  );
  static String get presentPeriod =>
      get('2021 — Present', '2021 — حتى الآن', '2021 — Heute');

  static String get labResultTitle => get('RESULT', 'النتيجة', 'ERGEBNIS');
  static String get labSectionTitle =>
      get('Engineering Lab.', 'المختبر الهندسي.', 'Technik-Labor.');

  static String get currentNameAurix => get('AURIX', 'أوريكس', 'AURIX');
  static String get currentChipStatus => get('STATUS', 'الحالة', 'STATUS');
  static String get currentBuildingValue =>
      get('AURIX (v1.0)', 'أوريكس (v1.0)', 'AURIX (v1.0)');
  static String get currentLearningValue => get(
    'Advanced Flutter Architecture',
    'معمارية فلاتر متقدمة',
    'Fortgeschrittene Flutter-Architektur',
  );
  static String get currentExploringValue => get(
    'AI × Mobile Systems',
    'الذكاء الاصطناعي × أنظمة الجوال',
    'KI × Mobile Systeme',
  );
  static String get currentAvailableValue => get(
    'Flutter / Mobile Opportunities',
    'فرص Flutter / تطوير الجوال',
    'Flutter / Mobile Möglichkeiten',
  );

  static String get aboutStatValueCsAi =>
      get('CS · AI', 'علوم حاسوب · ذكاء اصطناعي', 'CS · KI');
  static String get aboutStatValueFlutter =>
      get('Flutter · Web', 'Flutter · ويب', 'Flutter · Web');
  static String get aboutStatValueUiUx =>
      get('UI · UX', 'واجهات · تجربة', 'UI · UX');
  static String get aboutStatValueLangs =>
      get('EN · AR · DE', 'EN · AR · DE', 'EN · AR · DE');

  static String get navIdentity => get('Identity', 'الهوية', 'Identität');

  static String get identityEyebrow => get(
    'BRAND IDENTITY SYSTEM',
    'نظام الهوية البصرية',
    'VISUELLES IDENTITÄTSSYSTEM',
  );
  static String get identityHeroTitle => get(
    'Engineering Precision × Personal Authorship',
    'الدقة الهندسية × البصمة الشخصية',
    'Ingenieurspräzision × Persönliche Autorschaft',
  );
  static String get identityHeroStatement => get(
    'Engineered solutions. Human impact.',
    'حلول هندسية. أثر إنساني.',
    'Durchdachte Lösungen. Menschliche Wirkung.',
  );
  static String get identityHeroDesc => get(
    'A refined brand identity for a Senior Software Engineer focused on clarity, craftsmanship, and continuous impact through technology.',
    'هوية بصرية متقنة لمهندس برمجيات يركز على الوضوح والصنعة والأثر المستمر عبر التكنولوجيا.',
    'Eine verfeinerte Markenidentität für einen Senior Software Engineer, fokussiert auf Klarheit, Handwerkskunst und kontinuierliche Wirkung durch Technologie.',
  );
  static String get identityHeroRoleLine => get(
    'ENGINEER  ·  ARCHITECT  ·  PROBLEM SOLVER',
    'مهندس  ·  معماري  ·  محل مشكلات',
    'INGENIEUR  ·  ARCHITEKT  ·  PROBLEMLÖSER',
  );

  static String get identitySectionTitle => get(
    'Engineering precision & personal authorship: unveiling my new visual identity.',
    'دقة الهندسة.. وبصمة المؤلف: الكشف عن هويتي البصرية الجديدة.',
    'Ingenieurspräzision & persönliche Autorschaft: Meine neue visuelle Identität.',
  );
  static String get identitySectionSub => get(
    'I am pleased to share my new personal visual identity — a new stage in my journey as a software engineer and artificial intelligence specialist.',
    'يسعدني اليوم مشاركتكم هويتي البصرية الشخصية الجديدة، والتي تمثل مرحلة جديدة في مسيرتي كمهندس برمجيات ومتخصص في الذكاء الاصطناعي.',
    'Ich freue mich, meine neue persönliche visuelle Identität zu teilen — ein neuer Abschnitt in meiner Reise als Softwareingenieur und KI-Spezialist.',
  );

  static String get identityWhyNowLabel =>
      get('01 — WHY NOW', '01 — لماذا الآن؟', '01 — WARUM JETZT?');
  static String get identityWhyNowTitle =>
      get('Why now?', 'لماذا الآن؟', 'Warum jetzt?');
  static String get identityWhyNowBody => get(
    'As my work evolved across Software Architecture, cross-platform development with Flutter, and AI integration, I felt the need for an identity that does more than state my name — one that reflects the philosophy I follow at work: the balance between engineering precision and a personal touch.',
    'مع تطور عملي في معمارية البرمجيات (Software Architecture) وتطوير التطبيقات عبر المنصات (Flutter) ودمج حلول الذكاء الاصطناعي، شعرت بالحاجة إلى هوية لا تكتفي فقط بذكر اسمي، بل تعكس "الفلسفة" التي أتبعها في عملي: التوازن بين الدقة الهندسية واللمسة الشخصية.',
    'Während sich meine Arbeit in Softwarearchitektur, plattformübergreifender Entwicklung mit Flutter und KI-Integration weiterentwickelte, spürte ich das Bedürfnis nach einer Identität, die mehr tut, als meinen Namen zu nennen — eine, die die Philosophie meiner Arbeit widerspiegelt: die Balance zwischen Ingenieurspräzision und persönlicher Note.',
  );

  static String get identityStoryLabel =>
      get('02 — DESIGN STORY', '02 — قصة التصميم', '02 — DESIGN-GESCHICHTE');
  static String get identityStoryTitle => get(
    'From signature to symbol (Engineered Authorship)',
    'من التوقيع إلى الرمز (Engineered Authorship)',
    'Von der Unterschrift zum Symbol (Engineered Authorship)',
  );
  static String get identityStoryBody => get(
    'The core idea is drawn entirely from my personal signature. I wanted to transform "ink on paper" into an "engineered system".',
    'الفكرة الأساسية للتصميم مستمدة بالكامل من توقيعي الشخصي. لقد أردت تحويل "الحبر على الورق" إلى "نظام هندسي".',
    'Die Kernidee stammt vollständig aus meiner persönlichen Unterschrift. Ich wollte "Tinte auf Papier" in ein "technisches System" verwandeln.',
  );
  static String get identityMonogramTitle =>
      get('The Monogram (TB)', 'المونوغرام (TB)', 'Das Monogramm (TB)');
  static String get identityMonogramBody => get(
    'The sharp horizontal stroke was extracted from my signature to represent "precision" and "firmness", while the hand-drawn curves were turned into precise geometric arcs reflecting UI/UX craft.',
    'تم استخلاص الخط الأفقي الحاد من توقيعي ليمثل "الدقة" و"الحزم"، بينما تم تحويل الانحناءات اليدوية إلى أقواس هندسية دقيقة تعكس مهارات الـ UI/UX.',
    'Der scharfe horizontale Strich wurde aus meiner Unterschrift abgeleitet und steht für "Präzision" und "Bestimmtheit", während die handgezeichneten Kurven in präzise geometrische Bögen verwandelt wurden, die UI/UX-Kompetenz widerspiegeln.',
  );
  static String get identityBalanceTitle =>
      get('Balance', 'التوازن', 'Balance');
  static String get identityBalanceBody => get(
    'The symbol balances strength (straight lines) with flexibility (curves) — just like building software systems that are both complex and resilient.',
    'الرمز يجمع بين القوة (الخطوط المستقيمة) والمرونة (المنحنيات)، تماماً كما هو الحال في بناء أنظمة برمجية معقدة ومرنة في آن واحد.',
    'Das Symbol verbindet Stärke (gerade Linien) mit Flexibilität (Kurven) — genau wie komplexe und zugleich belastbare Softwaresysteme.',
  );


  static String get identityTechLabel => get(
    '03 — TECHNICAL DETAILS',
    '03 — التفاصيل التقنية',
    '03 — TECHNISCHE DETAILS',
  );
  static String get identityTechTitle =>
      get('Typography & Color', 'الخطوط ولوحة الألوان', 'Typografie & Farbe');
  static String get identityFontTitle =>
      get('Typography', 'الخطوط', 'Typografie');
  static String get identityFontBody => get(
    'A refined Serif for the primary name gives an academic, trustworthy character, paired with a Humanist Sans-Serif that reflects the modern technical side.',
    'اخترت خط Serif راقٍ للاسم الأساسي ليعطي طابعاً أكاديمياً وموثوقاً، مع خط Humanist Sans-Serif فرعي يعكس الجانب التقني الحديث.',
    'Eine edle Serif für den Namen verleiht einen akademischen, vertrauenswürdigen Charakter, gepaart mit einer Humanist Sans-Serif für die moderne technische Seite.',
  );
  static String get identityColorsTitle =>
      get('Color Palette', 'لوحة الألوان', 'Farbpalette');
  static String get identityColorCharcoal => get(
    'Charcoal (#1A1D21): represents depth and professionalism.',
    'Charcoal (#1A1D21): يمثل العمق والاحترافية.',
    'Charcoal (#1A1D21): steht für Tiefe und Professionalität.',
  );
  static String get identityColorOffWhite => get(
    'Off-White: conveys purity and academic clarity.',
    'Off-White: يعطي شعوراً بالنقاء والوضوح الأكاديمي.',
    'Off-White: vermittelt Reinheit und akademische Klarheit.',
  );
  static String get identityColorSilver => get(
    'Metallic Silver: symbolises artificial intelligence and the technical future.',
    'Metallic Silver: يرمز للذكاء الاصطناعي والمستقبل التقني.',
    'Metallic Silver: symbolisiert künstliche Intelligenz und die technische Zukunft.',
  );


  static String get identityConclusionLabel =>
      get('04 — CONCLUSION', '04 — الخلاصة', '04 — FAZIT');
  static String get identityConclusionTitle =>
      get('More than a logo.', 'أكثر من مجرد شعار.', 'Mehr als ein Logo.');
  static String get identityConclusionBody => get(
    'This identity is not merely a logo — it is a promise of commitment to quality, innovation, and professionalism in every line of code and every system I build.',
    'هذه الهوية ليست مجرد شعار، بل هي وعد بالالتزام بالجودة، الابتكار، والاحترافية في كل سطر برمج وكل نظام أقوم ببنائه.',
    'Diese Identität ist nicht nur ein Logo — sie ist ein Versprechen an Qualität, Innovation und Professionalität in jeder Zeile Code und jedem System, das ich baue.',
  );
  static String get identityThanks => get(
    'Thank you to everyone who supported me on this journey. What do you think of this transformation?',
    'أشكر كل من دعمني في هذه الرحلة. ما رأيكم في هذا التحول؟',
    'Danke an alle, die mich auf dieser Reise unterstützt haben. Was haltet ihr von dieser Transformation?',
  );
  static String get identityTags => get(
    '#PersonalBranding  #SoftwareEngineering  #AI  #Flutter  #UIUX  #SoftwareArchitecture  #TechIdentity',
    '#هوية_شخصية  #هندسة_البرمجيات  #ذكاء_اصطناعي  #Flutter  #UIUX  #معمارية_البرمجيات  #هوية_تقنية',
    '#PersonalBranding  #SoftwareEngineering  #AI  #Flutter  #UIUX  #SoftwareArchitecture  #TechIdentity',
  );


  static String get identityPhilosophyLabel => get(
    '05 — DESIGN PHILOSOPHY',
    '05 — فلسفة التصميم',
    '05 — DESIGN-PHILOSOPHIE',
  );
  static String get identityFontStyleTitle =>
      get('Font Style', 'نمط الخطوط', 'Schriftstil');
  static String get identityFontPrimary => get(
    'Primary: Modern Serif — expresses cognitive authority and expertise.',
    'Primary: Modern Serif — يعبر عن السلطة المعرفية والخبرة.',
    'Primary: Modern Serif — drückt kognitive Autorität und Expertise aus.',
  );
  static String get identityFontSecondary => get(
    'Secondary: Geometric/Humanist Sans-Serif — expresses modernity and technical clarity.',
    'Secondary: Geometric/Humanist Sans-Serif — يعبر عن الحداثة والوضوح التقني.',
    'Secondary: Geometric/Humanist Sans-Serif — drückt Modernität und technische Klarheit aus.',
  );
  static String get identityVisualTitle =>
      get('Visual Philosophy', 'الفلسفة البصرية', 'Visuelle Philosophie');
  static String get identityVisualBody => get(
    'The design follows Minimalism, focused on Grid-based Design — giving the impression that the logo was "constructed", not merely drawn.',
    'التصميم يتبع مدرسة Minimalism مع التركيز على Grid-based Design، بحيث يعطي انطباعاً بأن الشعار "تم بناؤه" (Constructed) وليس مجرد رسمه.',
    'Das Design folgt dem Minimalismus, mit Fokus auf Grid-based Design — der Eindruck, dass das Logo "konstruiert" wurde, nicht nur gezeichnet.',
  );
  static String get identityDesignConclusionTitle =>
      get('Design Conclusion', 'خلاصة التصميم', 'Design-Fazit');
  static String get identityDesignConclusionBody => get(
    'The identity was derived by analysing the "rhythm" of the hand while signing and translating that rhythm into a visual language understood by both engineers and designers.',
    'الهوية استُنتجت من خلال تحليل "إيقاع" (Rhythm) اليد أثناء التوقيع وتحويل هذا الإيقاع إلى لغة بصرية يفهمها المهندسون والمصممون على حد سواء.',
    'Die Identität entstand durch die Analyse des "Rhythmus" der Hand beim Unterschreiben und dessen Übersetzung in eine visuelle Sprache, die Ingenieure und Designer gleichermassen verstehen.',
  );


  static String get identityElementsTitle =>
      get('Brand Elements', 'عناصر الهوية', 'Markenelemente');
  static String get identityPrimaryLogo =>
      get('Primary Logo', 'الشعار الأساسي', 'Primäres Logo');
  static String get identityMonogram =>
      get('Monogram', 'المونوغرام', 'Monogramm');
  static String get identitySignatureMark =>
      get('Signature Mark', 'بصمة التوقيع', 'Unterschriften-Zeichen');
  static String get identityColorPalette =>
      get('Color Palette', 'لوحة الألوان', 'Farbpalette');
  static String get identityTypography =>
      get('Typography', 'الخطوط', 'Typografie');


  static String get identityPrimaryLogoCaption => get(
    'ENGINEER · ARCHITECT · PROBLEM SOLVER',
    'مهندس · معماري · محل مشكلات',
    'INGENIEUR · ARCHITEKT · PROBLEMLÖSER',
  );
  static String get identityMonogramCaption => get(
    'COMPACT · RECOGNIZABLE · VERSATILE',
    'مضغوط · مميز · متعدد الاستخدامات',
    'KOMPAKT · WIEDERERKENNBAR · VIELSEITIG',
  );
  static String get identitySignatureCaption => get(
    'PERSONAL · DISTINCTIVE · MEMORABLE',
    'شخصي · مميز · لا يُنسى',
    'PERSÖNLICH · UNVERWECHSELBAR · EINPRÄGSAM',
  );


  static String get attributeEngineeredTitle =>
      get('ENGINEERED', 'هندسي', 'DURCHDACHT');
  static String get attributeEngineeredBody => get(
    'The mark reflects structure, logic, and intentional design — built to solve complex problems.',
    'الرمز يعكس البنية والمنطق والتصميم المقصود — مبني لحل المشكلات المعقدة.',
    'Das Zeichen spiegelt Struktur, Logik und beabsichtigtes Design wider — gebaut, um komplexe Probleme zu lösen.',
  );
  static String get attributeTechnicalTitle =>
      get('TECHNICAL', 'تقني', 'TECHNISCH');
  static String get attributeTechnicalBody => get(
    'Clean, minimal, and scalable for use across digital platforms, code, and documentation.',
    'نظيف وبسيط وقابل للتوسع للاستخدام عبر المنصات الرقمية والكود والتوثيق.',
    'Sauber, minimalistisch und skalierbar für digitale Plattformen, Code und Dokumentation.',
  );
  static String get attributePersonalTitle =>
      get('PERSONAL', 'شخصي', 'PERSÖNLICH');
  static String get attributePersonalBody => get(
    'The signature adds a human touch that represents ownership, integrity, and trust.',
    'التوقيع يضيف لمسة إنسانية تمثل الملكية والنزاهة والثقة.',
    'Die Unterschrift verleiht eine menschliche Note, die Verantwortung, Integrität und Vertrauen repräsentiert.',
  );
  static String get attributeImpactTitle =>
      get('IMPACT DRIVEN', 'موجه بالأثر', 'WIRKUNGSORIENTIERT');
  static String get attributeImpactBody => get(
    'The identity is future-proof and adaptable — supporting growth, leadership, and meaningful impact.',
    'الهوية مقاومة للمستقبل وقابلة للتكيف — تدعم النمو والقيادة والأثر الهادف.',
    'Die Identität ist zukunftssicher und anpassungsfähig — unterstützt Wachstum, Führung und sinnvolle Wirkung.',
  );


  static String get colorCharcoalName => get('CHARCOAL', 'الفحمي', 'CHARCOAL');
  static String get colorCharcoalDesc => get(
    'Strength, sophistication, and timeless foundation.',
    'القوة والرقي والأساس الخالد.',
    'Stärke, Eleganz und zeitloses Fundament.',
  );
  static String get colorOffWhiteName =>
      get('OFF-WHITE', 'الأبيض المطفأ', 'OFF-WHITE');
  static String get colorOffWhiteDesc => get(
    'Clarity, balance, and clean thinking.',
    'الوضوح والتوازن والتفكير النظيف.',
    'Klarheit, Balance und klares Denken.',
  );
  static String get colorSilverName => get('SILVER', 'الفضي', 'SILVER');
  static String get colorSilverDesc => get(
    'Precision, technology, and forward thinking.',
    'الدقة والتقنية والتفكير المستقبلي.',
    'Präzision, Technologie und vorausschauendes Denken.',
  );


  static String get brandStatement => get(
    'Engineered solutions. Human impact.',
    'حلول هندسية. أثر إنساني.',
    'Durchdachte Lösungen. Menschliche Wirkung.',
  );


  static String get identityViewCaseStudy =>
      get('VIEW CASE STUDY', 'عرض دراسة الحالة', 'CASE STUDY ANSEHEN');
  static String get identityOpenPage => get(
    'Open Identity Case Study',
    'فتح دراسة حالة الهوية',
    'Identitäts-Case-Study öffnen',
  );
  static String get identityBack => get('Back', 'رجوع', 'Zurück');
  static String get identityMonogramName =>
      get('Monogram', 'المونوغرام', 'Monogramm');
}
