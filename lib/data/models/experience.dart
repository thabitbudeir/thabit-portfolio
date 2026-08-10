class ExperienceItem {
  final String id;
  final String title;
  final String organization;
  final String period;
  final String? description;

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
  final String degree;
  final String institution;
  final String period;
  final String? specialization;

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
    // Add real experience when available
  ];

  static List<EducationItem> get education => [
    EducationItem(
      id: 'bachelor',
      degree: 'Bachelor in Informatics Engineering',
      institution: 'Al-Sham Private University',
      period: '2021 — Present',
      specialization: 'Artificial Intelligence',
    ),
  ];
}
