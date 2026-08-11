import '../../core/localization/localized_string.dart';

class Certificate {
  final String id;
  final LocalizedString title;
  final LocalizedString organization;
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
      id: 'uiux-unrwa',
      title: const LocalizedString(en: 'UI/UX Design', ar: 'تصميم UI/UX'),
      organization: const LocalizedString(en: 'UNRWA', ar: 'الأونروا'),
      date: '2023',
      imageUrl: 'assets/certificates/ui_ux_unrwa.jpeg',
    ),
    Certificate(
      id: 'claude-101',
      title: const LocalizedString(en: 'Claude 101', ar: 'Claude 101'),
      organization: const LocalizedString(en: 'Anthropic', ar: 'Anthropic'),
      date: '2024',
      imageUrl: 'assets/certificates/claude101.jpeg',
    ),
    Certificate(
      id: 'claude-code',
      title: const LocalizedString(
        en: 'Claude Code in Action',
        ar: 'Claude Code في العمل',
      ),
      organization: const LocalizedString(en: 'Anthropic', ar: 'Anthropic'),
      date: '2024',
      imageUrl: 'assets/certificates/claude_code_in_action.jpeg',
    ),
    Certificate(
      id: 'programming-advices',
      title: const LocalizedString(
        en: 'Software Engineering Roadmap',
        ar: 'خارطة طريق هندسة البرمجيات',
      ),
      organization: const LocalizedString(
        en: 'Programming Advices',
        ar: 'Programming Advices',
      ),
      date: '2023',
      imageUrl: 'assets/certificates/ProgrammingAdvices.png',
    ),
    Certificate(
      id: 'icdl',
      title: const LocalizedString(en: 'ICDL Certification', ar: 'شهادة ICDL'),
      organization: const LocalizedString(en: 'ICDL', ar: 'ICDL'),
      date: '2022',
      imageUrl: 'assets/certificates/ICDL.png',
    ),
  ];
}
