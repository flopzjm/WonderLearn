import 'package:flutter_test/flutter_test.dart';
import 'package:wonderlearn_app/shared/models/lesson.dart';

void main() {
  group('Lesson Model', () {
    test('fromJson creates lesson correctly', () {
      final json = {
        'id': 'test-123',
        'moduleId': 'wonderbooks',
        'lessonType': 'phonics',
        'title': 'Fonética: Letra A',
        'description': 'Aprende la letra A',
        'difficulty': 1,
        'durationMin': 5,
        'orderIndex': 0,
        'contentJson': '{"letter":"A"}',
        'assetsJson': '{"image":"/images/a.png"}',
      };

      final lesson = Lesson.fromJson(json);

      expect(lesson.id, 'test-123');
      expect(lesson.moduleId, 'wonderbooks');
      expect(lesson.lessonType, 'phonics');
      expect(lesson.title, 'Fonética: Letra A');
      expect(lesson.difficulty, 1);
      expect(lesson.contentJson, {'letter': 'A'});
      expect(lesson.isPhonics, true);
      expect(lesson.isStory, false);
    });

    test('moduleDisplayName returns correct name', () {
      final wonderbooks = Lesson(
        id: '1',
        moduleId: 'wonderbooks',
        lessonType: 'phonics',
        title: 'Test',
        description: 'Test',
        difficulty: 1,
        durationMin: 5,
        orderIndex: 0,
        contentJson: {},
        assetsJson: {},
      );

      final wondermath = Lesson(
        id: '2',
        moduleId: 'wondermath',
        lessonType: 'counting',
        title: 'Test',
        description: 'Test',
        difficulty: 1,
        durationMin: 5,
        orderIndex: 0,
        contentJson: {},
        assetsJson: {},
      );

      final wondergrow = Lesson(
        id: '3',
        moduleId: 'wondergrow',
        lessonType: 'emotion',
        title: 'Test',
        description: 'Test',
        difficulty: 1,
        durationMin: 5,
        orderIndex: 0,
        contentJson: {},
        assetsJson: {},
      );

      expect(wonderbooks.moduleDisplayName, 'Lectura');
      expect(wondermath.moduleDisplayName, 'Matemáticas');
      expect(wondergrow.moduleDisplayName, 'Emociones');
    });

    test('lesson type checks work correctly', () {
      final lesson = Lesson(
        id: '1',
        moduleId: 'wonderbooks',
        lessonType: 'phonics',
        title: 'Test',
        description: 'Test',
        difficulty: 1,
        durationMin: 5,
        orderIndex: 0,
        contentJson: {},
        assetsJson: {},
      );

      expect(lesson.isPhonics, true);
      expect(lesson.isSightWord, false);
      expect(lesson.isStory, false);
      expect(lesson.isCounting, false);
      expect(lesson.isAddition, false);
      expect(lesson.isShape, false);
      expect(lesson.isPattern, false);
      expect(lesson.isEmotion, false);
      expect(lesson.isEmpathy, false);
      expect(lesson.isMindfulness, false);
    });
  });
}
