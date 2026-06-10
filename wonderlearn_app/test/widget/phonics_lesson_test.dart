import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wonderlearn_app/features/wonder_books/presentation/screens/phonics_lesson_screen.dart';

void main() {
  group('PhonicsLessonScreen Widget', () {
    testWidgets('displays the correct letter', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PhonicsLessonScreen(letter: 'A'),
        ),
      );

      expect(find.text('A'), findsOneWidget);
      expect(find.text('Letra A'), findsOneWidget);
    });

    testWidgets('displays word cards for the letter', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PhonicsLessonScreen(letter: 'A'),
        ),
      );

      // Word cards should be present
      expect(find.textContaining('rbol'), findsOneWidget);
      expect(find.textContaining('nana'), findsOneWidget);
      expect(find.textContaining('guila'), findsOneWidget);
    });

    testWidgets('has listen button', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PhonicsLessonScreen(letter: 'B'),
        ),
      );

      expect(find.text('Escuchar'), findsOneWidget);
      expect(find.byIcon(Icons.volume_up), findsOneWidget);
    });

    testWidgets('has practice button', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PhonicsLessonScreen(letter: 'C'),
        ),
      );

      expect(find.text('¡Practiquemos!'), findsOneWidget);
    });

    testWidgets('has close button', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PhonicsLessonScreen(letter: 'D'),
        ),
      );

      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('displays progress indicator', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PhonicsLessonScreen(letter: 'E'),
        ),
      );

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
      expect(find.text('1/3'), findsOneWidget);
    });

    testWidgets('word cards have icons', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PhonicsLessonScreen(letter: 'A'),
        ),
      );

      // Emoji icons in word cards
      expect(find.text('🌳'), findsOneWidget);
      expect(find.text('🍌'), findsOneWidget);
      expect(find.text('🦅'), findsOneWidget);
    });
  });
}
