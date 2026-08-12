import '../../core/localization/localized_string.dart';

class ExperienceItem {
  final String id;
  final LocalizedString title;
  final LocalizedString organization;
  final String period;
  final LocalizedString? description;

  ExperienceItem({
    required this.id,
    required this.title,
    required this.organization,
    required this.period,
    this.description,
  });
}

class EducationItem {
  final String id;
  final LocalizedString degree;
  final LocalizedString institution;
  final String period;
  final LocalizedString? specialization;

  EducationItem({
    required this.id,
    required this.degree,
    required this.institution,
    required this.period,
    this.specialization,
  });
}

class ExperienceData {
  static List<ExperienceItem> get experience => [
    ExperienceItem(
      id: 'unrwa-flutter-training',
      title: const LocalizedString(
        en: 'Flutter Developer Trainee',
        ar: 'متدرب مطوّر Flutter',
      ),
      organization: const LocalizedString(en: 'UNRWA', ar: 'الأونروا'),
      period: '2026 — Present',
      description: const LocalizedString(
        en: 'Hands-on Flutter training at UNRWA. Currently in progress — working toward the completion certificate.',
        ar: 'تدريب عملي على Flutter في الأونروا. جارٍ حالياً — أعمل على إتمامه والحصول على الشهادة.',
      ),
    ),
    ExperienceItem(
      id: 'local-development-committee',
      title: const LocalizedString(
        en: 'Volunteer Developer',
        ar: 'مطوّر متطوع',
      ),
      organization: const LocalizedString(
        en: 'Local Development Committee',
        ar: 'لجنة التنمية المحلية',
      ),
      period: '2025 — Present',
      description: const LocalizedString(
        en: 'Volunteer work building a population statistics platform alongside mobile applications, with data entry and verification. Ongoing since 2025.',
        ar: 'عمل تطوعي في بناء منصة إحصاء سكاني وتطوير تطبيقات، مع إدخال المعلومات وتدقيقها. مستمر منذ 2025.',
      ),
    ),
    ExperienceItem(
      id: 'unrwa-uiux',
      title: const LocalizedString(
        en: 'UI/UX Design Specialization',
        ar: 'تخصص تصميم UI/UX',
      ),
      organization: const LocalizedString(en: 'UNRWA', ar: 'الأونروا'),
      period: '3 Months · 2023',
      description: const LocalizedString(
        en: 'A three-month UI/UX program at UNRWA covering user research, wireframes, prototyping, and design systems — successfully completed and certified.',
        ar: 'برنامج UI/UX في الأونروا لمدة ثلاثة أشهر: أبحاث المستخدم، النماذج الأولية، وأنظمة التصميم — تم اجتيازه بنجاح والحصول على الشهادة.',
      ),
    ),
  ];

  static List<EducationItem> get education => [
    EducationItem(
      id: 'bachelor',
      degree: const LocalizedString(
        en: 'Bachelor in Informatics Engineering',
        ar: 'بكالوريوس هندسة معلوماتية',
      ),
      institution: const LocalizedString(
        en: 'Al-Sham Private University',
        ar: 'جامعة الشام الخاصة',
      ),
      period: '2021 — Present',
      specialization: const LocalizedString(
        en: 'Artificial Intelligence',
        ar: 'تخصص الذكاء الاصطناعي',
      ),
    ),
  ];
}
