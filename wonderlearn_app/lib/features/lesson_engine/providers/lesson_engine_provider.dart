import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/adaptive/adaptive_engine.dart';
import '../../core/adaptive/frustration_detector.dart';

// Lesson engine state
class LessonEngineState {
  final int currentStep;
  final int totalSteps;
  final int score;
  final int consecutiveCorrect;
  final int consecutiveIncorrect;
  final int difficulty;
  final bool showHint;
  final String? feedbackMessage;
  final bool isCompleted;
  final int sessionMinutes;

  LessonEngineState({
    this.currentStep = 0,
    this.totalSteps = 10,
    this.score = 0,
    this.consecutiveCorrect = 0,
    this.consecutiveIncorrect = 0,
    this.difficulty = 1,
    this.showHint = false,
    this.feedbackMessage,
    this.isCompleted = false,
    this.sessionMinutes = 0,
  });

  LessonEngineState copyWith({
    int? currentStep,
    int? totalSteps,
    int? score,
    int? consecutiveCorrect,
    int? consecutiveIncorrect,
    int? difficulty,
    bool? showHint,
    String? feedbackMessage,
    bool? isCompleted,
    int? sessionMinutes,
    bool clearFeedback = false,
  }) {
    return LessonEngineState(
      currentStep: currentStep ?? this.currentStep,
      totalSteps: totalSteps ?? this.totalSteps,
      score: score ?? this.score,
      consecutiveCorrect: consecutiveCorrect ?? this.consecutiveCorrect,
      consecutiveIncorrect: consecutiveIncorrect ?? this.consecutiveIncorrect,
      difficulty: difficulty ?? this.difficulty,
      showHint: showHint ?? this.showHint,
      feedbackMessage: clearFeedback ? null : (feedbackMessage ?? this.feedbackMessage),
      isCompleted: isCompleted ?? this.isCompleted,
      sessionMinutes: sessionMinutes ?? this.sessionMinutes,
    );
  }
}

// Lesson engine notifier
class LessonEngineNotifier extends StateNotifier<LessonEngineState> {
  final AdaptiveEngine _adaptiveEngine;
  final FrustrationDetector _frustrationDetector;

  LessonEngineNotifier()
      : _adaptiveEngine = AdaptiveEngine(),
        _frustrationDetector = FrustrationDetector(),
        super(LessonEngineState());

  void initLesson(int totalSteps) {
    state = LessonEngineState(totalSteps: totalSteps);
  }

  void recordCorrectAnswer() {
    final newConsecutiveCorrect = state.consecutiveCorrect + 1;
    final newScore = state.score + 1;

    // Check if should increase difficulty
    final adaptiveResult = _adaptiveEngine.getAdaptiveDifficulty(
      consecutiveSuccesses: newConsecutiveCorrect,
      consecutiveFailures: 0,
      currentMastery: _getMasteryFromDifficulty(state.difficulty),
    );

    state = state.copyWith(
      currentStep: state.currentStep + 1,
      score: newScore,
      consecutiveCorrect: newConsecutiveCorrect,
      consecutiveIncorrect: 0,
      difficulty: adaptiveResult.difficulty,
      showHint: adaptiveResult.hint,
      feedbackMessage: adaptiveResult.message,
      isCompleted: state.currentStep + 1 >= state.totalSteps,
    );
  }

  void recordIncorrectAnswer() {
    final newConsecutiveIncorrect = state.consecutiveIncorrect + 1;
    _frustrationDetector.recordError();

    // Check if should decrease difficulty
    final adaptiveResult = _adaptiveEngine.getAdaptiveDifficulty(
      consecutiveSuccesses: 0,
      consecutiveFailures: newConsecutiveIncorrect,
      currentMastery: _getMasteryFromDifficulty(state.difficulty),
    );

    // Check for frustration
    final frustrationResult = _frustrationDetector.detectFrustration(
      recentErrors: _frustrationDetector.recentErrors,
      timeWindow: const Duration(seconds: 120),
    );

    state = state.copyWith(
      currentStep: state.currentStep + 1,
      consecutiveCorrect: 0,
      consecutiveIncorrect: newConsecutiveIncorrect,
      difficulty: adaptiveResult.difficulty,
      showHint: adaptiveResult.hint || frustrationResult.frustrated,
      feedbackMessage: frustrationResult.frustrated
          ? frustrationResult.message
          : adaptiveResult.message,
      isCompleted: state.currentStep + 1 >= state.totalSteps,
    );
  }

  void clearFeedback() {
    state = state.copyWith(clearFeedback: true);
  }

  void incrementSessionMinutes() {
    final newMinutes = state.sessionMinutes + 1;
    final shouldSuggestMindfulness =
        _adaptiveEngine.shouldSuggestMindfulness(newMinutes);

    state = state.copyWith(
      sessionMinutes: newMinutes,
      showHint: shouldSuggestMindfulness,
      feedbackMessage: shouldSuggestMindfulness
          ? '¡Hiciste un gran esfuerzo! ¿Qué tal una respiración?'
          : null,
    );
  }

  String _getMasteryFromDifficulty(int difficulty) {
    switch (difficulty) {
      case 5:
      case 4:
        return 'proficient';
      case 3:
      case 2:
        return 'developing';
      default:
        return 'novice';
    }
  }
}

final lessonEngineProvider =
    StateNotifierProvider<LessonEngineNotifier, LessonEngineState>((ref) {
  return LessonEngineNotifier();
});
