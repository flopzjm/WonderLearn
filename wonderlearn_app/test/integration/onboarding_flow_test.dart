import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:wonderlearn_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Onboarding Flow', () {
    testWidgets('completes onboarding successfully', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Welcome screen
      expect(find.text('WonderLearn'), findsOneWidget);
      expect(find.text('¡Comenzar!'), findsOneWidget);

      // Tap get started
      await tester.tap(find.text('¡Comenzar!'));
      await tester.pumpAndSettle();

      // Create account screen
      expect(find.text('Crear Cuenta'), findsOneWidget);

      // Fill in email
      await tester.enterText(
        find.byType(TextFormField).first,
        'test@example.com',
      );

      // Fill in password
      await tester.enterText(
        find.byType(TextFormField).last,
        'password123',
      );

      // Tap create account
      await tester.tap(find.text('Crear Cuenta'));
      await tester.pumpAndSettle();

      // Child profile screen
      expect(find.text('¿Cómo se llama?'), findsOneWidget);

      // Enter name
      await tester.enterText(
        find.byType(TextFormField),
        'Lucas',
      );

      // Select age (5 years old)
      await tester.tap(find.text('5'));
      await tester.pumpAndSettle();

      // Select avatar (dragon)
      await tester.tap(find.text('🐲'));
      await tester.pumpAndSettle();

      // Tap ready
      await tester.tap(find.text('¡Listo!'));
      await tester.pumpAndSettle();

      // Home screen
      expect(find.text('¡Jugar!'), findsOneWidget);
      expect(find.text('Lucas'), findsOneWidget);
    });
  });

  group('Learning Flow', () {
    testWidgets('navigates to learning map', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Assume we're logged in
      await tester.tap(find.text('¡Jugar!'));
      await tester.pumpAndSettle();

      // Learning map screen
      expect(find.text('Mapa de Aprendizaje'), findsOneWidget);
    });

    testWidgets('opens phonics lesson', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Navigate to phonics
      await tester.tap(find.text('Lectura'));
      await tester.pumpAndSettle();

      // Library screen
      expect(find.text('Biblioteca de Cuentos'), findsOneWidget);
    });
  });

  group('Parent Panel', () {
    testWidgets('accesses parent panel with double tap', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Double tap parent icon
      await tester.tap(find.byIcon(Icons.settings));
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      // Parent dashboard
      expect(find.text('Panel de Padres'), findsOneWidget);
    });
  });
}
