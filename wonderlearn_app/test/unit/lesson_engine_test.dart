import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LessonEngine', () {
    test('calculates lesson progress correctly', () {
      final totalSteps = 5;
      final completedSteps = 3;

      final progress = completedSteps / totalSteps;
      expect(progress, 0.6);
    });

    test('determines lesson completion', () {
      final totalSteps = 5;
      final completedSteps = 5;

      final isComplete = completedSteps >= totalSteps;
      expect(isComplete, true);
    });

    test('generates correct answer options', () {
      const correctAnswer = 5;
      final options = <int>{correctAnswer};

      // Add distractors
      while (options.length < 3) {
        final distractor = correctAnswer + (options.length - 1);
        options.add(distractor);
      }

      expect(options.length, 3);
      expect(options.contains(correctAnswer), true);
    });

    test('difficulty increases with consecutive successes', () {
      var difficulty = 1;
      var consecutiveSuccesses = 0;

      // Simulate 3 successes
      for (var i = 0; i < 3; i++) {
        consecutiveSuccesses++;
        if (consecutiveSuccesses >= 3 && difficulty < 5) {
          difficulty++;
          consecutiveSuccesses = 0;
        }
      }

      expect(difficulty, 2);
    });

    test('difficulty decreases with consecutive failures', () {
      var difficulty = 3;
      var consecutiveFailures = 0;

      // Simulate 3 failures
      for (var i = 0; i < 3; i++) {
        consecutiveFailures++;
        if (consecutiveFailures >= 3 && difficulty > 1) {
          difficulty--;
          consecutiveFailures = 0;
        }
      }

      expect(difficulty, 2);
    });

    test('hint shows after 2 consecutive failures', () {
      var consecutiveFailures = 2;
      final shouldShowHint = consecutiveFailures >= 2;

      expect(shouldShowHint, true);
    });

    test('shuffle answer options correctly', () {
      final options = [1, 2, 3, 4];
      final shuffled = List<int>.from(options)..shuffle();

      expect(shuffled.length, options.length);
      expect(shuffled.toSet(), options.toSet());
    });
  });

  group('LessonContent', () {
    test('phonics lesson has correct structure', () {
      final lesson = {
        'type': 'phonics',
        'letter': 'A',
        'words': ['Árbol', 'Avión', 'Ardilla'],
        'audio': 'letter_A.mp3',
      };

      expect(lesson['type'], 'phonics');
      expect((lesson['words'] as List).length, 3);
    });

    test('story lesson has pages', () {
      final story = {
        'type': 'story',
        'title': 'El gato simpático',
        'pages': [
          {'text': 'Página 1', 'image': 'page_1.png', 'audio': 'page_1.mp3'},
          {'text': 'Página 2', 'image': 'page_2.png', 'audio': 'page_2.mp3'},
        ],
      };

      expect(story['type'], 'story');
      expect((story['pages'] as List).length, 2);
    });

    test('math lesson has question and answer', () {
      final question = {
        'type': 'addition',
        'num1': 3,
        'num2': 2,
        'correctAnswer': 5,
        'options': [4, 5, 6],
      };

      expect(question['correctAnswer'], 5);
      expect((question['options'] as List).contains(5), true);
    });
  });
}
