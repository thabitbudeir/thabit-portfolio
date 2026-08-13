import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../core/animations/animations.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/design_system.dart';
import '../../../core/theme/typography.dart';
import '../../../core/widgets/editorial_card.dart';
import '../../../core/widgets/ui_primitives.dart';

class WhatIDoSection extends StatelessWidget {
  const WhatIDoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final domains = [
      _Domain(
        '01',
        AppStrings.domainInformatics,
        AppStrings.domainInformaticsDesc,
        0,
      ),
      _Domain(
        '02',
        AppStrings.domainSoftware,
        AppStrings.domainSoftwareDesc,
        1,
      ),
      _Domain('03', AppStrings.domainAI, AppStrings.domainAIDesc, 2),
      _Domain('04', AppStrings.domainDesign, AppStrings.domainDesignDesc, 3),
    ];

    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            label: AppStrings.sectionWhatIDo,
            title: AppStrings.get(
              'What I do.',
              'ماذا أقدّم.',
              'Was ich mache.',
            ),
            subtitle: AppStrings.whatIDoHeadline,
          ),
          const SizedBox(height: AppSpacing.xxl),
          LayoutBuilder(
            builder: (context, c) {
              final columns = c.maxWidth >= 1100
                  ? 4
                  : c.maxWidth >= 760
                  ? 2
                  : 1;
              return Wrap(
                spacing: AppSpacing.lg,
                runSpacing: AppSpacing.lg,
                children: domains.asMap().entries.map((entry) {
                  final i = entry.key;
                  final d = entry.value;
                  final width = columns == 1
                      ? c.maxWidth
                      : (c.maxWidth - AppSpacing.lg * (columns - 1)) / columns;
                  return SizedBox(
                    width: width,
                    child: RevealOnScroll(
                      delay: Duration(milliseconds: 80 * i),
                      child: _DomainCard(
                        number: d.number,
                        title: d.title,
                        body: d.body,
                        pattern: d.pattern,
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Domain {
  final String number;
  final String title;
  final String body;
  final int pattern;
  _Domain(this.number, this.title, this.body, this.pattern);
}

class _DomainCard extends StatelessWidget {
  final String number;
  final String title;
  final String body;
  final int pattern;

  const _DomainCard({
    required this.number,
    required this.title,
    required this.body,
    required this.pattern,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppText.of(context);
    return SmoothLift(
      lift: 4,
      child: EditorialCard(
        number: number,
        onTap: () {}, // Make card interactive
        semanticLabel: title,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 96,
              child: RepaintBoundary(
                child: CustomPaint(
                  painter: _DomainPatternPainter(
                    type: pattern,
                    isDark: Theme.of(context).brightness == Brightness.dark,
                    accent: context.accent,
                  ),
                  size: const Size(double.infinity, 96),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(title, style: t.heading2),
            const SizedBox(height: AppSpacing.sm),
            Text(body, style: t.body),
          ],
        ),
      ),
    );
  }
}

class _DomainPatternPainter extends CustomPainter {
  final int type;
  final bool isDark;
  final Color accent;
  _DomainPatternPainter({
    required this.type,
    required this.isDark,
    required this.accent,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = accent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    switch (type) {
      case 0:
        // System layers
        for (int i = 0; i < 5; i++) {
          final y = 10 + i * 18;
          canvas.drawLine(
            Offset(8, y.toDouble()),
            Offset(size.width - 8, y.toDouble()),
            paint,
          );
        }
        break;
      case 1:
        // Wave — product signal
        final path = Path();
        for (double x = 0; x <= size.width; x += 4) {
          final y =
              size.height / 2 +
              ((x.toInt() % 2 == 0) ? (x / size.width) : (1 - x / size.width)) *
                  size.height *
                  0.3;
          if (x == 0) {
            path.moveTo(x, y);
          } else {
            path.lineTo(x, y);
          }
        }
        canvas.drawPath(path, paint);
        break;
      case 2:
        // Network of nodes
        final cx = size.width / 2;
        final cy = size.height / 2;
        final r = 28.0;
        for (int i = 0; i < 6; i++) {
          final a = (i / 6) * math.pi * 2;
          final p = Offset(
            cx + r * 1.5 * math.cos(a),
            cy + r * 1.2 * math.sin(a),
          );
          canvas.drawCircle(p, 2.5, paint..style = PaintingStyle.fill);
          canvas.drawLine(
            Offset(cx, cy),
            p,
            paint..style = PaintingStyle.stroke,
          );
        }
        canvas.drawCircle(Offset(cx, cy), 4, paint..style = PaintingStyle.fill);
        break;
      case 3:
        // Design grid
        for (double x = 0; x < size.width; x += 24) {
          canvas.drawLine(
            Offset(x, 0),
            Offset(x, size.height),
            paint..strokeWidth = 0.5,
          );
        }
        for (double y = 0; y < size.height; y += 24) {
          canvas.drawLine(
            Offset(0, y),
            Offset(size.width, y),
            paint..strokeWidth = 0.5,
          );
        }
        canvas.drawRect(
          Rect.fromLTWH(size.width * 0.6, size.height * 0.25, 36, 36),
          paint
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.5,
        );
        break;
    }
  }

  @override
  bool shouldRepaint(covariant _DomainPatternPainter oldDelegate) =>
      oldDelegate.type != type || oldDelegate.isDark != isDark;
}
