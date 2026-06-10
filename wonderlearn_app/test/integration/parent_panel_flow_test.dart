import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:wonderlearn_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Parent Panel Flow', () {
    testWidgets('accesses parent panel with double tap', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Double tap parent icon
      await tester.tap(find.byIcon(Icons.settings));
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      // Should be on parent dashboard
      expect(find.text('Panel de Padres'), findsOneWidget);
    });

    testWidgets('displays child statistics', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Access parent panel
      await tester.tap(find.byIcon(Icons.settings));
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      // Should show stats
      expect(find.text('Hoy'), findsOneWidget);
      expect(find.text('Tiempo'), findsOneWidget);
      expect(find.text('Lecciones'), findsOneWidget);
    });

    testWidgets('displays weekly chart', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Access parent panel
      await tester.tap(find.byIcon(Icons.settings));
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      // Should show weekly chart
      expect(find.text('Esta semana'), findsOneWidget);
    });

    testWidgets('displays skills progress', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Access parent panel
      await tester.tap(find.byIcon(Icons.settings));
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      // Should show skills
      expect(find.text('Habilidades'), findsOneWidget);
      expect(find.text('Lectura'), findsOneWidget);
      expect(find.text('Matemáticas'), findsOneWidget);
      expect(find.text('Emociones'), findsOneWidget);
    });

    testWidgets('displays recent lessons', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Access parent panel
      await tester.tap(find.byIcon(Icons.settings));
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      // Should show recent lessons
      expect(find.text('Lecciones recientes'), findsOneWidget);
    });

    testWidgets('navigates to settings', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Access parent panel
      await tester.tap(find.byIcon(Icons.settings));
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      // Tap settings button
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();
    });

    testWidgets('can set time limits', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Access parent panel and navigate to settings
      await tester.tap(find.byIcon(Icons.settings));
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      // This would test time limit configuration
    });

    testWidgets('can toggle modules', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Access parent panel and navigate to settings
      await tester.tap(find.byIcon(Icons.settings));
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      // This would test module toggling
    });
  });

  group('Parent PIN Auth', () {
    testWidgets('requires PIN to access panel', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // This would test PIN authentication
      // Double tap should trigger PIN entry
    });
  });
}
