

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portofalio/main.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  testWidgets('Portfolio home renders hero content', (
    WidgetTester tester,
  ) async {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
    await tester.pumpWidget(const PortfolioApp(initialIsDark: true));
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.textContaining('Thabit Budeir'), findsWidgets);
    expect(find.textContaining('Flutter', findRichText: true), findsWidgets);
    expect(find.textContaining('and ship', findRichText: true), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
  });
}
