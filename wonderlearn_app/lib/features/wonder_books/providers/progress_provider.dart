import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../../../core/api/endpoints.dart';
import '../../../shared/models/lesson_progress.dart';
import '../../../shared/models/skill_tracking.dart';

// Progress state
class ProgressState {
  final List<LessonProgress> lessons;
  final List<SkillTracking> skills;
  final int totalStars;
  final int totalMinutes;
  final bool isLoading;
  final String? error;

  ProgressState({
    this.lessons = const [],
    this.skills = const [],
    this.totalStars = 0,
    this.totalMinutes = 0,
    this.isLoading = false,
    this.error,
  });

  ProgressState copyWith({
    List<LessonProgress>? lessons,
    List<SkillTracking>? skills,
    int? totalStars,
    int? totalMinutes,
    bool? isLoading,
    String? error,
  }) {
    return ProgressState(
      lessons: lessons ?? this.lessons,
      skills: skills ?? this.skills,
      totalStars: totalStars ?? this.totalStars,
      totalMinutes: totalMinutes ?? this.totalMinutes,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

// Progress notifier
class ProgressNotifier extends StateNotifier<ProgressState> {
  final ApiEndpoints _api;

  ProgressNotifier(this._api) : super(ProgressState());

  Future<void> loadProgress(String childId) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _api.getChildProgress(childId);
      state = state.copyWith(
        lessons: (result['lessons'] as List)
            .map((l) => LessonProgress.fromJson(l))
            .toList(),
        skills: (result['skills'] as List)
            .map((s) => SkillTracking.fromJson(s))
            .toList(),
        totalStars: result['stats']['totalStars'] ?? 0,
        totalMinutes: result['stats']['totalMinutes'] ?? 0,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> submitLessonProgress({
    required String childId,
    required String lessonId,
    required String status,
    required int score,
    required int correctAnswers,
    required int totalQuestions,
    required int timeSpentSeconds,
    List<Map<String, dynamic>>? skillUpdates,
  }) async {
    try {
      await _api.submitLessonProgress({
        'lessonId': lessonId,
        'status': status,
        'score': score,
        'correctAnswers': correctAnswers,
        'totalQuestions': totalQuestions,
        'timeSpentSeconds': timeSpentSeconds,
        'skillUpdates': skillUpdates,
      });

      // Reload progress
      await loadProgress(childId);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

final progressProvider = StateNotifierProvider<ProgressNotifier, ProgressState>((ref) {
  final api = ref.watch(apiEndpointsProvider);
  return ProgressNotifier(api);
});
