class Design {
  final String id;
  final String title;
  final String category;
  final String imageUrl;
  final bool isLarge;

  Design({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    this.isLarge = false,
  });
}

class DesignData {
  static List<Design> get designs => [
    // Add real design images when available
    // This is a placeholder structure
    Design(
      id: 'design1',
      title: 'Mobile App Interface',
      category: 'Mobile Design',
      imageUrl: 'assets/designs/design1.jpg',
      isLarge: true,
    ),
    Design(
      id: 'design2',
      title: 'Dashboard UI',
      category: 'Web Design',
      imageUrl: 'assets/designs/design2.jpg',
    ),
    Design(
      id: 'design3',
      title: 'E-commerce Flow',
      category: 'UX Design',
      imageUrl: 'assets/designs/design3.jpg',
    ),
  ];
}
