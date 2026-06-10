class LessonProgress {
  final String id;
  final String childId;
  final String lessonId;
  final String status;
  final int score;
  final int attempts;
  final int correctAnswers;
  final int totalQuestions;
  final int timeSpentSeconds;
  final DateTime? completedAt;
  final DateTime createdAt;

  LessonProgress({
    required this.id,
    required this.childId,
    required this.lessonId,
    required this.status,
    required this.score,
    required this.attempts,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.timeSpentSeconds,
    this.completedAt,
    required this.createdAt,
  });

  factory LessonProgress.fromJson(Map<String, dynamic> json) {
    return LessonProgress(
      id: json['id'],
      childId: json['childId'],
      lessonId: json['lessonId'],
      status: json['status'],
      score: json['score'],
      attempts: json['attempts'],
      correctAnswers: json['correctAnswers'],
      totalQuestions: json['totalQuestions'],
      timeSpentSeconds: json['timeSpentSeconds'],
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'])
          : null,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'childId': childId,
      'lessonId': lessonId,
      'status': status,
      'score': score,
      'attempts': attempts,
      'correctAnswers': correctAnswers,
      'totalQuestions': totalQuestions,
      'timeSpentSeconds': timeSpentSeconds,
      'completedAt': completedAt?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  bool get isCompleted => status == 'completed';
  bool get isStarted => status == 'started';
  bool get isAbandoned => status == 'abandoned';

  double get accuracy =>
      totalQuestions > 0 ? correctAnswers / totalQuestions : 0;

  String get starsDisplay => '⭐' * score;
}
