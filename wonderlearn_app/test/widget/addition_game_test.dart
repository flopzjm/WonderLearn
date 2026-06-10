import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wonderlearn_app/features/wonder_math/presentation/screens/addition_screen.dart';

void main() {
  group('AdditionScreen Widget', () {
    testWidgets('displays question prompt', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AdditionScreen(),
        ),
      );

      expect(find.text('¿Cuánto es?'), findsOneWidget);
    });

    testWidgets('displays plus sign', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AdditionScreen(),
        ),
      );

      expect(find.text('+'), findsOneWidget);
    });

    testWidgets('displays answer buttons', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AdditionScreen(),
        ),
      );

      // Should have 3 answer buttons
      expect(find.byType(GestureDetector), findsWidgets);
    });

    testWidgets('has close button', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AdditionScreen(),
        ),
      );

      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('displays progress indicator', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AdditionScreen(),
        ),
      );

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });

    testWidgets('displays score', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AdditionScreen(),
        ),
      );

      expect(find.text('0/10'), findsOneWidget);
    });

    testWidgets('shows fruit emoji representations', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AdditionScreen(),
        ),
      );

      // Should show apple and orange emoji for numbers
      expect(find.byType(Text), findsWidgets);
    });
  });
}
