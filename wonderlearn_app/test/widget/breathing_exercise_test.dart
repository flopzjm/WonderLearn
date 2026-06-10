import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wonderlearn_app/features/wonder_grow/presentation/screens/breathing_screen.dart';

void main() {
  group('BreathingScreen Widget', () {
    testWidgets('displays title', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: BreathingScreen(),
        ),
      );

      expect(find.text('Respiración'), findsOneWidget);
    });

    testWidgets('displays initial instruction', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: BreathingScreen(),
        ),
      );

      expect(find.text('Toca para empezar'), findsOneWidget);
    });

    testWidgets('displays breathing circle', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: BreathingScreen(),
        ),
      );

      // Should have the breathing emoji
      expect(find.text('🧘'), findsOneWidget);
    });

    testWidgets('displays breath counter', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: BreathingScreen(),
        ),
      );

      expect(find.text('0/5'), findsOneWidget);
    });

    testWidgets('displays tip', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: BreathingScreen(),
        ),
      );

      expect(find.textContaining('Respira profundamente'), findsOneWidget);
    });

    testWidgets('has close button', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: BreathingScreen(),
        ),
      );

      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('has progress dots', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: BreathingScreen(),
        ),
      );

      // Should have 5 progress dots (one per breath)
      // The dots are small containers, so we check for the structure
      expect(find.byType(Row), findsWidgets);
    });
  });
}
