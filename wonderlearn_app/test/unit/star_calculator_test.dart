import 'package:flutter_test/flutter_test.dart';
import 'package:wonderlearn_app/shared/utils/star_calculator.dart';

void main() {
  group('StarCalculator', () {
    test('returns 3 stars for perfect score', () {
      final stars = StarCalculator.calculate(
        correctAnswers: 10,
        totalQuestions: 10,
        timeSpentSeconds: 60,
        maxTimeSeconds: 120,
      );
      expect(stars, 3);
    });

    test('returns 2 stars for good score', () {
      final stars = StarCalculator.calculate(
        correctAnswers: 7,
        totalQuestions: 10,
        timeSpentSeconds: 90,
        maxTimeSeconds: 120,
      );
      expect(stars, 2);
    });

    test('returns 1 star for passing score', () {
      final stars = StarCalculator.calculate(
        correctAnswers: 5,
        totalQuestions: 10,
        timeSpentSeconds: 110,
        maxTimeSeconds: 120,
      );
      expect(stars, 1);
    });

    test('returns 0 stars for failing score', () {
      final stars = StarCalculator.calculate(
        correctAnswers: 3,
        totalQuestions: 10,
        timeSpentSeconds: 130,
        maxTimeSeconds: 120,
      );
      expect(stars, 0);
    });

    test('handles division by zero', () {
      final stars = StarCalculator.calculate(
        correctAnswers: 0,
        totalQuestions: 0,
        timeSpentSeconds: 0,
        maxTimeSeconds: 120,
      );
      expect(stars, 0);
    });
  });
}
