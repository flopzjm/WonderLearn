class StarCalculator {
  static int calculate({
    required int correctAnswers,
    required int totalQuestions,
    required int timeSpentSeconds,
    int maxTimeSeconds = 120,
  }) {
    if (totalQuestions == 0) return 0;

    final accuracy = correctAnswers / totalQuestions;
    final timeEfficiency = 1 - (timeSpentSeconds / maxTimeSeconds).clamp(0.0, 1.0);

    // Weighted score: 70% accuracy, 30% time
    final score = (accuracy * 0.7) + (timeEfficiency * 0.3);

    if (score >= 0.8) return 3;
    if (score >= 0.5) return 2;
    if (score >= 0.3) return 1;
    return 0;
  }
}
