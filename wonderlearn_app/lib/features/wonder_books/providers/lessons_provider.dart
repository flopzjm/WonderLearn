import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../../../core/api/endpoints.dart';
import '../../../shared/models/lesson.dart';

// Lessons state
class LessonsState {
  final List<Lesson> lessons;
  final List<Lesson> phonics;
  final List<Lesson> sightWords;
  final List<Lesson> stories;
  final List<Lesson> math;
  final List<Lesson> sel;
  final Lesson? currentLesson;
  final bool isLoading;
  final String? error;

  LessonsState({
    this.lessons = const [],
    this.phonics = const [],
    this.sightWords = const [],
    this.stories = const [],
    this.math = const [],
    this.sel = const [],
    this.currentLesson,
    this.isLoading = false,
    this.error,
  });

  LessonsState copyWith({
    List<Lesson>? lessons,
    List<Lesson>? phonics,
    List<Lesson>? sightWords,
    List<Lesson>? stories,
    List<Lesson>? math,
    List<Lesson>? sel,
    Lesson? currentLesson,
    bool? isLoading,
    String? error,
    bool clearCurrent = false,
  }) {
    return LessonsState(
      lessons: lessons ?? this.lessons,
      phonics: phonics ?? this.phonics,
      sightWords: sightWords ?? this.sightWords,
      stories: stories ?? this.stories,
      math: math ?? this.math,
      sel: sel ?? this.sel,
      currentLesson: clearCurrent ? null : (currentLesson ?? this.currentLesson),
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

// Lessons notifier
class LessonsNotifier extends StateNotifier<LessonsState> {
  final ApiEndpoints _api;

  LessonsNotifier(this._api) : super(LessonsState());

  Future<void> loadAllLessons() async {
    state = state.copyWith(isLoading: true);
    try {
      final results = await Future.wait([
        _api.getPhonics(),
        _api.getSightWords(),
        _api.getStories(),
        _api.getMath(),
        _api.getSel(),
      ]);

      state = state.copyWith(
        phonics: results[0].map((l) => Lesson.fromJson(l)).toList(),
        sightWords: results[1].map((l) => Lesson.fromJson(l)).toList(),
        stories: results[2].map((l) => Lesson.fromJson(l)).toList(),
        math: results[3].map((l) => Lesson.fromJson(l)).toList(),
        sel: results[4].map((l) => Lesson.fromJson(l)).toList(),
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadPhonics() async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _api.getPhonics();
      state = state.copyWith(
        phonics: result.map((l) => Lesson.fromJson(l)).toList(),
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadStories({String? category}) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _api.getStories(category: category);
      state = state.copyWith(
        stories: result.map((l) => Lesson.fromJson(l)).toList(),
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadLesson(String id) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _api.getLesson(id);
      state = state.copyWith(
        currentLesson: Lesson.fromJson(result),
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

final lessonsProvider = StateNotifierProvider<LessonsNotifier, LessonsState>((ref) {
  final api = ref.watch(apiEndpointsProvider);
  return LessonsNotifier(api);
});

final phonicsProvider = Provider<List<Lesson>>((ref) {
  return ref.watch(lessonsProvider).phonics;
});

final sightWordsProvider = Provider<List<Lesson>>((ref) {
  return ref.watch(lessonsProvider).sightWords;
});

final storiesProvider = Provider<List<Lesson>>((ref) {
  return ref.watch(lessonsProvider).stories;
});

final mathProvider = Provider<List<Lesson>>((ref) {
  return ref.watch(lessonsProvider).math;
});

final selProvider = Provider<List<Lesson>>((ref) {
  return ref.watch(lessonsProvider).sel;
});
