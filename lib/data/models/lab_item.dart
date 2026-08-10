class LabItem {
  final String id;
  final String title;
  final String description;
  final String technicalApproach;
  final String technology;
  final String status;
  final String? result;

  LabItem({
    required this.id,
    required this.title,
    required this.description,
    required this.technicalApproach,
    required this.technology,
    required this.status,
    this.result,
  });
}

class LabData {
  static List<LabItem> get items => [
    LabItem(
      id: 'binary-engine',
      title: 'Paint-Driven Binary Engine',
      description: 'A high-performance "binary rain" background effect that avoids widget tree rebuilds.',
      technicalApproach: 'Utilizes a custom AnimationController linked directly to a CustomPainter repaint property. State updates happen during the paint phase to bypass the Build/Layout stages of the Flutter pipeline.',
      technology: 'Flutter · CustomPaint · Low-level Animation',
      status: 'STABLE / DEPLOYED',
      result: 'Achieved consistent 60fps on web with near-zero CPU usage for UI rebuilds.',
    ),
    LabItem(
      id: 'aura-visibility',
      title: 'Visibility-Aware AI Aura',
      description: 'Interactive motion system that dynamically pauses execution based on viewport visibility.',
      technicalApproach: 'Integrated VisibilityDetector with AnimationController lifecycle. Uses mathematical sine-wave noise for organic organic shapes without expensive vertex calculations.',
      technology: 'Flutter · Math · Visibility API',
      status: 'STABLE',
    ),
    LabItem(
      id: 'mcdm-logic',
      title: 'MCDM Decision Engine',
      description: 'Algorithmic implementation of Multi-Criteria Decision Making for objective ranking.',
      technicalApproach: 'Implemented weighted sum models and normalization logic in pure Dart to evaluate complex tender criteria.',
      technology: 'Dart · Algorithms · AI Logic',
      status: 'EXPERIMENTAL',
      result: 'Successfully powers the ranking system in the AURIX flagship project.',
    ),
  ];
}
