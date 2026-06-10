import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wonderlearn_app/core/widgets/star_rating.dart';

void main() {
  group('StarRating Widget', () {
    testWidgets('renders correct number of stars', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StarRating(stars: 2),
          ),
        ),
      );

      final starIcons = find.byIcon(Icons.star);
      final borderIcons = find.byIcon(Icons.star_border);

      expect(starIcons findsNWidgets(2));
      expect(borderIcons, findsNWidgets(1));
    });

    testWidgets('shows all stars filled when max', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StarRating(stars: 3, maxStars: 3),
          ),
        ),
      );

      final starIcons = find.byIcon(Icons.star);
      expect(starIcons, findsNWidgets(3));
    });

    testWidgets('shows no stars when zero', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StarRating(stars: 0),
          ),
        ),
      );

      final starIcons = find.byIcon(Icons.star);
      final borderIcons = find.byIcon(Icons.star_border);

      expect(starIcons, findsNothing);
      expect(borderIcons, findsNWidgets(3));
    });

    testWidgets('respects custom size', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StarRating(stars: 1, size: 48),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.star).first);
      expect(icon.size, 48);
    });
  });
}
