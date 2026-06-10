import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:wonderlearn_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Full Lesson Flow', () {
    testWidgets('completes phonics lesson flow', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Navigate to learning map
      await tester.tap(find.text('¡Jugar!'));
      await tester.pumpAndSettle();

      // Tap on phonics node A
      await tester.tap(find.text('A'));
      await tester.pumpAndSettle();

      // Should be on phonics lesson screen
      expect(find.text('Letra A'), findsOneWidget);
      expect(find.text('Escuchar'), findsOneWidget);

      // Tap listen button
      await tester.tap(find.text('Escuchar'));
      await tester.pumpAndSettle();

      // Tap practice button
      await tester.tap(find.text('¡Practiquemos!'));
      await tester.pumpAndSettle();
    });

    testWidgets('completes addition lesson flow', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Navigate to learning map
      await tester.tap(find.text('¡Jugar!'));
      await tester.pumpAndSettle();

      // Tap on addition node
      await tester.tap(find.text('+'));
      await tester.pumpAndSettle();

      // Should be on addition screen
      expect(find.text('¿Cuánto es?'), findsOneWidget);
      expect(find.text('+'), findsOneWidget);
    });

    testWidgets('completes breathing exercise flow', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Navigate to learning map
      await tester.tap(find.text('¡Jugar!'));
      await tester.pumpAndSettle();

      // Tap on breathing node
      await tester.tap(find.text('🧘'));
      await tester.pumpAndSettle();

      // Should be on breathing screen
      expect(find.text('Respiración'), findsOneWidget);
      expect(find.text('Toca para empezar'), findsOneWidget);
    });

    testWidgets('completes story reading flow', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Navigate to library
      await tester.tap(find.text('Lectura'));
      await tester.pumpAndSettle();

      // Should see library
      expect(find.text('Biblioteca de Cuentos'), findsOneWidget);
    });

    testWidgets('navigates back from lesson', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Navigate to learning map
      await tester.tap(find.text('¡Jugar!'));
      await tester.pumpAndSettle();

      // Open phonics lesson
      await tester.tap(find.text('A'));
      await tester.pumpAndSettle();

      // Tap close button
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      // Should be back on learning map
      expect(find.text('Mapa de Aprendizaje'), findsOneWidget);
    });
  });

  group('Gamification Flow', () {
    testWidgets('earns stars after lesson', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // This would test star earning after completing a lesson
      // Navigate through a lesson and verify stars are shown
    });

    testWidgets('unlocks badges', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Navigate to badges screen
      await tester.tap(find.text('¡Jugar!'));
      await tester.pumpAndSettle();

      // This would test badge unlocking
    });
  });
}
