class Project {
  final String id;
  final String number;
  final String name;
  final String description;
  final String longDescription;
  final String technologies;
  final String role;
  final String problem;
  final String solution;
  final String architecture;
  final String keyFeatures;
  final String challenges;
  final String learnings;
  final String imageUrl;
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
    required this.architecture,
    required this.keyFeatures,
    required this.challenges,
    required this.learnings,
    required this.imageUrl,
    this.githubUrl,
    this.demoUrl,
  });
}

class ProjectData {
  static List<Project> get projects => [
    Project(
      id: 'aurix',
      number: '01',
      name: 'AURIX',
      description: 'Smart Tender Management System',
      longDescription:
          'A comprehensive tender management system that streamlines the procurement process for organizations. The platform enables efficient creation, submission, and evaluation of tenders with intelligent features.',
      technologies: 'Flutter · Laravel · PostgreSQL · AI',
      role: 'Lead Flutter Developer',
      problem:
          'Organizations faced challenges in managing tenders efficiently, with manual processes leading to delays, errors, and lack of transparency.',
      solution:
          'Built a cross-platform Flutter application with a Laravel backend, implementing AI-powered features for document analysis and smart matching.',
      architecture:
          'Mobile-first architecture with RESTful API, PostgreSQL database, and integrated AI services for document processing.',
      keyFeatures:
          '• Smart document upload and parsing\n• AI-based tender matching\n• Real-time notifications\n• Multi-role access control\n• Comprehensive reporting dashboard',
      challenges:
          'Implementing real-time synchronization across devices, optimizing document processing performance, and ensuring data security.',
      learnings:
          'Gained deep experience in state management with GetX, API integration patterns, and implementing AI features in mobile applications.',
      imageUrl: 'assets/projects/aurix.jpg',
      githubUrl: 'https://github.com/thabitbudeir/aurix',
      demoUrl: null,
    ),
  ];
}
