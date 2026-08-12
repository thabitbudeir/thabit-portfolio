// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portofalio/main.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  testWidgets('Portfolio home renders hero content', (
    WidgetTester tester,
  ) async {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
    // Updated constructor call to include required initialIsDark parameter
    await tester.pumpWidget(const PortfolioApp(initialIsDark: true));
    await tester.pump(const Duration(milliseconds: 300));

    // The hero eyebrow contains the name + the highlighted headline line.
    expect(find.textContaining('Thabit Budeir'), findsWidgets);
    expect(find.textContaining('Flutter', findRichText: true), findsWidgets);
    expect(find.textContaining('and ship', findRichText: true), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
  });
}
