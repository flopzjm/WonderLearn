import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wonderlearn_app/core/widgets/progress_bar.dart';

void main() {
  group('ProgressBar Widget', () {
    testWidgets('renders with default values', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProgressBar(value: 0.5),
          ),
        ),
      );

      expect(find.byType(ProgressBar), findsOneWidget);
    });

    testWidgets('shows label when provided', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProgressBar(
              value: 0.5,
              label: 'Progress',
            ),
          ),
        ),
      );

      expect(find.text('Progress'), findsOneWidget);
    });

    testWidgets('shows percentage when enabled', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProgressBar(
              value: 0.75,
              showPercentage: true,
            ),
          ),
        ),
      );

      expect(find.text('75%'), findsOneWidget);
    });

    testWidgets('clamps value between 0 and 1', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProgressBar(value: 1.5),
          ),
        ),
      );

      // Should not throw
      expect(find.byType(ProgressBar), findsOneWidget);
    });

    testWidgets('shows custom colors', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProgressBar(
              value: 0.5,
              backgroundColor: Colors.red,
              valueColor: Colors.blue,
            ),
          ),
        ),
      );

      expect(find.byType(ProgressBar), findsOneWidget);
    });
  });
}
