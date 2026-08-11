import '../../core/localization/app_strings.dart';

class SkillCategory {
  final String id;
  final String number;
  final String name;
  final String description;
  final List<String> skills;

  SkillCategory({
    required this.id,
    required this.number,
    required this.name,
    this.description = '',
    required this.skills,
  });
}

class SkillData {
  static List<SkillCategory> get categories => [
    SkillCategory(
      id: 'mobile',
      number: '01',
      name: AppStrings.skillMobile,
      skills: ['Flutter', 'Dart', 'GetX', 'REST APIs', 'Dio'],
    ),
    SkillCategory(
      id: 'backend',
      number: '02',
      name: AppStrings.skillBackend,
      skills: ['Laravel', 'REST APIs', 'Firebase'],
    ),
    SkillCategory(
      id: 'databases',
      number: '03',
      name: AppStrings.skillDatabases,
      skills: ['MySQL', 'PostgreSQL'],
    ),
    SkillCategory(
      id: 'ai',
      number: '04',
      name: AppStrings.skillAI,
      skills: ['AI', 'OCR', 'RAG', 'Decision Systems'],
    ),
    SkillCategory(
      id: 'design',
      number: '05',
      name: AppStrings.skillDesign,
      skills: ['UI/UX', 'Figma', 'Design Systems'],
    ),
    SkillCategory(
      id: 'tools',
      number: '06',
      name: AppStrings.skillTools,
      skills: ['Git', 'GitHub', 'VS Code'],
    ),
  ];
}
