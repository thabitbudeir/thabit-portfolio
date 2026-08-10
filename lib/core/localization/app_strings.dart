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
  static String get navLab => get('Lab', 'المختبر', 'Labor');

  // Accessibility
  static String get menuOpen => get('Open menu', 'فتح القائمة', 'Menü öffnen');
  static String get menuClose => get('Close menu', 'إغلاق القائمة', 'Menü schließen');
  static String get goToHome => get('Go to home', 'الذهاب للرئيسية', 'Zur Startseite');
  static String get closePreview => get('Close preview', 'إغلاق المعاينة', 'Vorschau schließen');

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
  static String get viewWork => get('VIEW WORK', 'عرض الأعمال', 'ARBEIT ANSEHEN');
  static String get contactMe => get('CONTACT ME', 'تواصل معي', 'KONTAKT');
  static String get statusLabel => get('STATUS', 'الحالة', 'STATUS');
  static String get statusOpen => get('Open to projects', 'متاح للمشاريع', 'Offen für Projekte');
  static String get focusLabel => get('FOCUS', 'التركيز', 'FOKUS');
  static String get focusValue => get('Flutter · Mobile · AI · UI/UX', 'Flutter · موبايل · ذكاء اصطناعي · UI/UX', 'Flutter · Mobile · KI · UI/UX');
  static String get basedInLabel => get('BASED IN', 'المقر', 'STANDORT');
  static String get basedInValue => get('Syria · Remote', 'سوريا · عن بُعد', 'Syrien · Remote');

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
  static String get sectionLab =>
      get('10 — TECHNICAL LAB', '10 — المختبر التقني', '10 — TECHNISCHES LABOR');

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
  static String get profileLabel => get('PROFILE', 'الملف الشخصي', 'PROFIL');
  static String get layersLabel => get('LAYERS', 'الطبقات', 'SCHICHTEN');
  static String get statEngineer => get('ENGINEER', 'مهندس', 'INGENIEUR');
  static String get statBuilder => get('BUILDER', 'مطور', 'BUILDER');
  static String get statDesigner => get('DESIGNER', 'مصمم', 'DESIGNER');
  static String get statLanguages => get('LANGUAGES', 'اللغات', 'SPRACHEN');
  static String get thabitSignature => get('— Thabit Budeir', '— ثابت بدير', '— Thabit Budeir');

  // Current work
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
  static String get availableForLabel => get('Available for', 'متاح لـ', 'Verfügbar für');

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
  static String get nowLabel => get('// now', '// الآن', '// jetzt');

  // Projects
  static String get projectsHeadline => get('Selected projects.', 'مشاريع مختارة.', 'Ausgewählte Projekte.');
  static String get projectsSub => get(
    'Real products, real problems, real systems. Each entry below is a product-shaped body of work, not a screenshot.',
    'منتجات حقيقية، مشاكل حقيقية، أنظمة حقيقية. كل عنصر هنا هو عمل بمنتج متكامل، وليس لقطة شاشة.',
    'Echte Produkte, echte Probleme, echte Systeme. Jeder Eintrag ist produktförmige Arbeit, kein Screenshot.',
  );
  static String get featuredLabel => get('FEATURED', 'مميز', 'HIGHLIGHT');
  static String get projectLabel => get('PROJECT', 'مشروع', 'PROJEKT');
  static String get roleLabel => get('Role', 'الدور', 'Rolle');

  // Case Study
  static String get caseStudyOverview => get('01 — OVERVIEW', '01 — نظرة عامة', '01 — ÜBERSICHT');
  static String get caseStudyProblem => get('02 — THE PROBLEM', '02 — المشكلة', '02 — DAS PROBLEM');
  static String get caseStudySolution => get('03 — THE SOLUTION', '03 — الحل', '03 — DIE LÖSUNG');
  static String get caseStudyMyRole => get('04 — MY ROLE', '04 — دوري', '04 — MEINE ROLLE');
  static String get caseStudyArchitecture => get('05 — ARCHITECTURE', '05 — المعمارية', '05 — ARCHITEKTUR');
  static String get caseStudyFeatures => get('06 — CORE FEATURES', '06 — الميزات الأساسية', '06 — HAUPTMERKMALE');
  static String get caseStudyChallenges => get('07 — TECHNICAL CHALLENGES', '07 — التحديات التقنية', '07 — TECHNISCHE HERAUSFORDERUNGEN');
  static String get caseStudyAI => get('08 — AI / DECISION ENGINE', '08 — الذكاء الاصطناعي / محرك القرار', '08 — KI / ENTSCHEIDUNGS-ENGINE');
  static String get caseStudySecurity => get('09 — SECURITY', '09 — الأمان', '09 — SICHERHEIT');
  static String get caseStudyPerformance => get('10 — PERFORMANCE', '10 — الأداء', '10 — PERFORMANCE');
  static String get caseStudyScreens => get('11 — SCREENS / VISUALS', '11 — لقطات الشاشة / بصريات', '11 — SCREENS / VISUALS');
  static String get caseStudyLinks => get('12 — LINKS', '12 — الروابط', '12 — LINKS');
  static String get viewCaseStudy => get('CASE STUDY', 'دراسة حالة', 'CASE STUDY');
  static String get archInteractiveHint => get('Tap a component to explore technical details', 'اضغط على مكون لاستكشاف التفاصيل التقنية', 'Tippen Sie auf eine Komponente, um technische Details zu erkunden');
  static String get archSystemMap => get('INTERACTIVE SYSTEM MAP', 'خريطة النظام التفاعلية', 'INTERAKTIVE SYSTEMKARTE');

  // Lab
  static String get labHeadline => get('Experiments & engineering curiosity.', 'تجارب وفضول هندسي.', 'Experimente & technische Neugier.');
  static String get labApproach => get('Approach', 'النهج التقني', 'Ansatz');
  static String get labStatus => get('Status', 'الحالة', 'Status');
  static String get labExplore => get('EXPLORE', 'استكشاف', 'ERKUNDEN');
  static String get labResult => get('RESULT', 'النتيجة', 'ERGEBNIS');

  // Recruiter View
  static String get recruiterMode => get('RECRUITER MODE', 'وضع الموظف', 'RECRUITER-MODUS');
  static String get recruiterHint => get('High-impact summary for fast evaluation.', 'ملخص عالي التأثير للتقييم السريع.', 'Hocheffektive Zusammenfassung zur schnellen Bewertung.');

  // Resume
  static String get viewResume => get('VIEW RESUME', 'عرض السيرة الذاتية', 'LEBENSLAUF ANSEHEN');
  static String get downloadPdf => get('DOWNLOAD PDF', 'تحميل PDF', 'PDF HERUNTERLADEN');

  // Skills
  static String get skillsHeadline => get('Stack & workflow.', 'المهارات وسير العمل.', 'Stack & Workflow.');
  static String get skillsSub => get(
    'The tools I work with daily, and how I put them together.',
    'الأدوات التي أعمل بها يومياً، وكيف أجمعها معاً.',
    'Die Werkzeuge, mit denen ich täglich arbeite, und wie ich sie verbindه.',
  );

  // Designs
  static String get designsHeadline => get('UI/UX gallery.', 'معرض تصاميم UI/UX.', 'UI/UX-Galerie.');
  static String get designsSub => get(
    'Interface work — product, mobile, and web.',
    'أعمال واجهات — منتجات، موبايل، وويب.',
    'Interface-Arbeit — Produkt, Mobile und Web.',
  );

  // Certificates
  static String get certificatesHeadline => get('Certificates.', 'الشهادات.', 'Zertifikate.');
  static String get certificatesSub => get(
    'Formal recognition of completed work and learning.',
    'اعتراف رسمي بأعمال وتعلّم مكتمل.',
    'Formale Anerkennung abgeschlossener Arbeit und Lernens.',
  );

  // Experience
  static String get experienceHeadline => get('Trajectory.', 'المسار المهني.', 'Werdegang.');
  static String get experienceSub => get(
    'Where I have been, what I have been doing, and what it has built.',
    'أين كنت، ماذا فعلت، وما الذي بنيناه.',
    'Wo ich war, was ich getan habe und was es aufgebaut hat.',
  );
  static String get experienceWork => get('Experience', 'الخبرة', 'Erfahrung');
  static String get experienceEdu => get('Education', 'التعليم', 'Ausbildung');
  static String get comingSoon => get('// coming soon', '// قريباً', '// kommt bald');

  // Modals
  static String get closeLabel => get('CLOSE', 'إغلاق', 'SCHLIESSEN');
  static String get githubLabel => get('GITHUB', 'GITHUB', 'GITHUB');
  static String get liveDemoLabel => get('LIVE DEMO', 'عرض حي', 'LIVE-DEMO');
  static String get problemLabel => get('Problem', 'المشكلة', 'Problem');
  static String get solutionLabel => get('Solution', 'الحل', 'Lösung');
  static String get technologiesLabel => get('Technologies', 'التقنيات', 'Technologien');
  static String get featuresLabel => get('Key Features', 'الميزات الرئيسية', 'Hauptmerkmale');

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

  // Footer
  static String get footerTagline => get(
    'INFORMATICS ENGINEER  ·  FLUTTER DEVELOPER  ·  AI BUILDER',
    'مهندس معلوماتية  ·  مطور Flutter  ·  بناء أنظمة ذكاء اصطناعي',
    'INFORMATIKINGENIEUR  ·  FLUTTER-ENTWICKLER  ·  KI-BUILDER',
  );
  static String get allRightsReserved => get(
    'All rights reserved.',
    'جميع الحقوق محفوظة.',
    'Alle Rechte vorbehalten.',
  );
}
