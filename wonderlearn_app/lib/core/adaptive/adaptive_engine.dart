class AdaptiveEngine {
  static const int consecutiveSuccessToIncrease = 3;
  static const int consecutiveFailureToDecrease = 3;
  static const int frustrationErrorThreshold = 5;
  static const int mindfulnessSuggestionMinutes = 15;

  int getDifficultyFromMastery(String masteryLevel) {
    switch (masteryLevel) {
      case 'mastered':
        return 5;
      case 'proficient':
        return 4;
      case 'developing':
        return 2;
      case 'novice':
        return 1;
      default:
        return 1;
    }
  }

  AdaptiveResult getAdaptiveDifficulty({
    required int consecutiveSuccesses,
    required int consecutiveFailures,
    required String currentMastery,
  }) {
    if (consecutiveSuccesses >= consecutiveSuccessToIncrease) {
      final currentDifficulty = getDifficultyFromMastery(currentMastery);
      return AdaptiveResult(
        difficulty: (currentDifficulty + 1).clamp(1, 5),
        hint: false,
        message: '¡Excelente! Aumentando dificultad...',
      );
    }

    if (consecutiveFailures >= consecutiveFailureToDecrease) {
      final currentDifficulty = getDifficultyFromMastery(currentMastery);
      return AdaptiveResult(
        difficulty: (currentDifficulty - 1).clamp(1, 5),
        hint: true,
        message: 'Vamos a practicar algo más fácil...',
      );
    }

    return AdaptiveResult(
      difficulty: getDifficultyFromMastery(currentMastery),
      hint: false,
    );
  }

  FrustrationResult detectFrustration({
    required int recentErrors,
    required Duration timeWindow,
  }) {
    if (recentErrors >= frustrationErrorThreshold &&
        timeWindow.inMilliseconds <= 120000) {
      return FrustrationResult(
        frustrated: true,
        suggestion: 'mindfulness',
        message: '¡Tu mascota quiere tomar una pausa contigo!',
      );
    }

    return FrustrationResult(frustrated: false);
  }

  bool shouldSuggestMindfulness(int sessionMinutes) {
    return sessionMinutes >= mindfulnessSuggestionMinutes;
  }
}

class AdaptiveResult {
  final int difficulty;
  final bool hint;
  final String? message;

  AdaptiveResult({
    required this.difficulty,
    required this.hint,
    this.message,
  });
}

class FrustrationResult {
  final bool frustrated;
  final String? suggestion;
  final String? message;

  FrustrationResult({
    required this.frustrated,
    this.suggestion,
    this.message,
  });
}
