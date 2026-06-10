import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wonderlearn_app/features/parent_panel/presentation/screens/dashboard_screen.dart';

void main() {
  group('DashboardScreen Widget', () {
    testWidgets('displays panel title', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: DashboardScreen(childId: 'child-1'),
        ),
      );

      expect(find.text('Panel de Padres'), findsOneWidget);
    });

    testWidgets('displays child name', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: DashboardScreen(childId: 'child-1'),
        ),
      );

      expect(find.text('Lucas'), findsOneWidget);
    });

    testWidgets('displays child age and level', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: DashboardScreen(childId: 'child-1'),
        ),
      );

      expect(find.text('5 años • Nivel 3'), findsOneWidget);
    });

    testWidgets('displays today stats', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: DashboardScreen(childId: 'child-1'),
        ),
      );

      expect(find.text('Hoy'), findsOneWidget);
      expect(find.text('Tiempo'), findsOneWidget);
      expect(find.text('Lecciones'), findsOneWidget);
      expect(find.text('Restante'), findsOneWidget);
    });

    testWidgets('displays weekly chart', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: DashboardScreen(childId: 'child-1'),
        ),
      );

      expect(find.text('Esta semana'), findsOneWidget);
    });

    testWidgets('displays skills section', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: DashboardScreen(childId: 'child-1'),
        ),
      );

      expect(find.text('Habilidades'), findsOneWidget);
      expect(find.text('Lectura'), findsOneWidget);
      expect(find.text('Matemáticas'), findsOneWidget);
      expect(find.text('Emociones'), findsOneWidget);
    });

    testWidgets('displays recent lessons', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: DashboardScreen(childId: 'child-1'),
        ),
      );

      expect(find.text('Lecciones recientes'), findsOneWidget);
      expect(find.text('Fonética: Letra C'), findsOneWidget);
    });

    testWidgets('has settings button', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: DashboardScreen(childId: 'child-1'),
        ),
      );

      expect(find.byIcon(Icons.settings), findsOneWidget);
    });

    testWidgets('displays dragon avatar', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: DashboardScreen(childId: 'child-1'),
        ),
      );

      expect(find.text('🐲'), findsOneWidget);
    });
  });
}
