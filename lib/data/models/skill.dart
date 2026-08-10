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
      name: 'MOBILE DEVELOPMENT',
      skills: ['Flutter', 'Dart', 'GetX', 'REST APIs'],
    ),
    SkillCategory(
      id: 'backend',
      number: '02',
      name: 'BACKEND',
      skills: ['Laravel', 'PostgreSQL', 'Firebase'],
    ),
    SkillCategory(
      id: 'ai',
      number: '03',
      name: 'ARTIFICIAL INTELLIGENCE',
      skills: ['AI', 'OCR', 'RAG', 'Decision Systems'],
    ),
    SkillCategory(
      id: 'design',
      number: '04',
      name: 'DESIGN',
      skills: ['UI/UX', 'Figma', 'Design Systems'],
    ),
    SkillCategory(
      id: 'tools',
      number: '05',
      name: 'TOOLS',
      skills: ['Git', 'GitHub', 'VS Code'],
    ),
  ];
}
