import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wonderlearn_app/features/learning_map/presentation/screens/learning_map_screen.dart';

void main() {
  group('LearningMapScreen Widget', () {
    testWidgets('displays map title', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LearningMapScreen(),
        ),
      );

      expect(find.text('Mapa de Aprendizaje'), findsOneWidget);
    });

    testWidgets('displays WonderBooks zone', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LearningMapScreen(),
        ),
      );

      expect(find.text('Bosque de Letras'), findsOneWidget);
    });

    testWidgets('displays WonderMath zone', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LearningMapScreen(),
        ),
      );

      expect(find.text('Montaña de Números'), findsOneWidget);
    });

    testWidgets('displays WonderGrow zone', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LearningMapScreen(),
        ),
      );

      expect(find.text('Lago de Emociones'), findsOneWidget);
    });

    testWidgets('displays phonics nodes', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LearningMapScreen(),
        ),
      );

      // Letter nodes
      expect(find.text('A'), findsOneWidget);
      expect(find.text('B'), findsOneWidget);
      expect(find.text('C'), findsOneWidget);
    });

    testWidgets('displays math nodes', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LearningMapScreen(),
        ),
      );

      expect(find.text('1-5'), findsOneWidget);
      expect(find.text('+'), findsOneWidget);
    });

    testWidgets('displays emotion nodes', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LearningMapScreen(),
        ),
      );

      expect(find.text('😊'), findsOneWidget);
      expect(find.text('😢'), findsOneWidget);
      expect(find.text('😤'), findsOneWidget);
    });

    testWidgets('has back button', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LearningMapScreen(),
        ),
      );

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('displays zone icons', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LearningMapScreen(),
        ),
      );

      expect(find.text('📚'), findsOneWidget);
      expect(find.text('🔢'), findsOneWidget);
      expect(find.text('💚'), findsOneWidget);
    });
  });
}
