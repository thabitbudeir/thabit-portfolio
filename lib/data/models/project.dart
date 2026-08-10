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
  final String? architectureDesc;
  final String keyFeatures;
  final String challenges;
  final String learnings;
  final String? security;
  final String? performance;
  final String? aiIntegration;
  final String imageUrl;
  final List<String>? galleryImages;
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
    this.architectureDesc,
    required this.keyFeatures,
    required this.challenges,
    required this.learnings,
    this.security,
    this.performance,
    this.aiIntegration,
    required this.imageUrl,
    this.galleryImages,
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
      technologies: 'Flutter · Laravel · PostgreSQL · AI · MCDM · GetX · Firebase',
      role: 'Lead Flutter Developer & UI Architect',
      problem:
          'Organizations faced challenges in managing tenders efficiently, with manual processes leading to delays, errors, and lack of transparency in decision-making.',
      solution:
          'Built a cross-platform Flutter application integrated with a Laravel backend. The solution implements a multi-role ecosystem where tenders are analyzed and matched using AI and MCDM algorithms.',
      architectureDesc:
          'Mobile-first architecture using GetX for state management. RESTful API communication with a Laravel backend and PostgreSQL database. Integration with Firebase for real-time notifications.',
      keyFeatures:
          '• Smart document upload and parsing\n• AI-based tender matching\n• Multi-Criteria Decision Making (MCDM) evaluation\n• Real-time notifications\n• Multi-role access control\n• Comprehensive reporting dashboard',
      challenges:
          'Implementing real-time synchronization across devices, optimizing document processing performance for large PDFs, and building a responsive RTL UI for Arabic users.',
      learnings:
          'Gained deep experience in state management with GetX, API integration patterns, and implementing complex AI-assisted decision-making features in mobile applications.',
      security:
          'Implemented Role-Based Access Control (RBAC), secure token authentication, and encrypted document storage to ensure data integrity and confidentiality.',
      performance:
          'Optimized rendering using reusable widget systems, implemented local caching for document metadata, and used lazy loading for high-resolution attachments.',
      aiIntegration:
          'Integrated a decision engine using MCDM (Multi-Criteria Decision Making) to rank tender submissions objectively. Utilized AI for automated document analysis and verification.',
      imageUrl: 'assets/projects/aurix.jpg',
      galleryImages: [
        'assets/projects/aurix_1.jpg',
        'assets/projects/aurix_2.jpg',
      ],
      githubUrl: 'https://github.com/thabitbudeir/aurix',
      demoUrl: null,
    ),
  ];
}
