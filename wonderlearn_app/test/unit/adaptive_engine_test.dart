import 'package:flutter_test/flutter_test.dart';
import 'package:wonderlearn_app/core/adaptive/adaptive_engine.dart';

void main() {
  group('AdaptiveEngine', () {
    late AdaptiveEngine engine;

    setUp(() {
      engine = AdaptiveEngine();
    });

    test('getDifficultyFromMastery returns correct difficulty', () {
      expect(engine.getDifficultyFromMastery('novice'), 1);
      expect(engine.getDifficultyFromMastery('developing'), 2);
      expect(engine.getDifficultyFromMastery('proficient'), 4);
      expect(engine.getDifficultyFromMastery('mastered'), 5);
      expect(engine.getDifficultyFromMastery('unknown'), 1);
    });

    test('increases difficulty after 3 consecutive successes', () {
      final result = engine.getAdaptiveDifficulty(
        consecutiveSuccesses: 3,
        consecutiveFailures: 0,
        currentMastery: 'developing',
      );

      expect(result.difficulty, 3);
      expect(result.hint, false);
      expect(result.message, contains('Excelente'));
    });

    test('decreases difficulty after 3 consecutive failures', () {
      final result = engine.getAdaptiveDifficulty(
        consecutiveSuccesses: 0,
        consecutiveFailures: 3,
        currentMastery: 'proficient',
      );

      expect(result.difficulty, 3);
      expect(result.hint, true);
      expect(result.message, contains('fácil'));
    });

    test('does not change difficulty with less than 3 consecutive', () {
      final result = engine.getAdaptiveDifficulty(
        consecutiveSuccesses: 2,
        consecutiveFailures: 1,
        currentMastery: 'developing',
      );

      expect(result.difficulty, 2);
      expect(result.hint, false);
    });

    test('difficulty stays within bounds (1-5)', () {
      // Try to increase from max
      final maxResult = engine.getAdaptiveDifficulty(
        consecutiveSuccesses: 3,
        consecutiveFailures: 0,
        currentMastery: 'mastered',
      );
      expect(maxResult.difficulty, 5);

      // Try to decrease from min
      final minResult = engine.getAdaptiveDifficulty(
        consecutiveSuccesses: 0,
        consecutiveFailures: 3,
        currentMastery: 'novice',
      );
      expect(minResult.difficulty, 1);
    });

    test('shouldSuggestMindfulness returns true after 15 minutes', () {
      expect(engine.shouldSuggestMindfulness(14), false);
      expect(engine.shouldSuggestMindfulness(15), true);
      expect(engine.shouldSuggestMindfulness(20), true);
    });
  });

  group('FrustrationDetector', () {
    // FrustrationDetector tests would go here
    // They need to be adapted for async timing
  });
}
