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
  static List<ExperienceItem> get experience => [];

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
