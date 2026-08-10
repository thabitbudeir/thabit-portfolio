class Certificate {
  final String id;
  final String title;
  final String organization;
  final String date;
  final String imageUrl;

  Certificate({
    required this.id,
    required this.title,
    required this.organization,
    required this.date,
    required this.imageUrl,
  });
}

class CertificateData {
  static List<Certificate> get certificates => [
    Certificate(
      id: 'flutter',
      title: 'Flutter Development',
      organization: 'Google',
      date: '2023',
      imageUrl: 'assets/certificates/flutter.jpg',
    ),
    Certificate(
      id: 'uiux',
      title: 'UI/UX Design Fundamentals',
      organization: 'Google',
      date: '2023',
      imageUrl: 'assets/certificates/uiux.jpg',
    ),
    Certificate(
      id: 'claude101',
      title: 'Claude 101',
      organization: 'Anthropic',
      date: '2024',
      imageUrl: 'assets/certificates/claude101.jpg',
    ),
    Certificate(
      id: 'claudeCode',
      title: 'Claude Code in Action',
      organization: 'Anthropic',
      date: '2024',
      imageUrl: 'assets/certificates/claudeCode.jpg',
    ),
    Certificate(
      id: 'icdl',
      title: 'ICDL Certification',
      organization: 'ICDL',
      date: '2022',
      imageUrl: 'assets/certificates/icdl.jpg',
    ),
  ];
}
