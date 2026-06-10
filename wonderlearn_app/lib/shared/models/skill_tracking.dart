class SkillTracking {
  final String id;
  final String childId;
  final String skillName;
  final String masteryLevel;
  final int consecutiveSuccesses;
  final int consecutiveFailures;
  final int totalAttempts;
  final DateTime? lastPracticed;

  SkillTracking({
    required this.id,
    required this.childId,
    required this.skillName,
    required this.masteryLevel,
    required this.consecutiveSuccesses,
    required this.consecutiveFailures,
    required this.totalAttempts,
    this.lastPracticed,
  });

  factory SkillTracking.fromJson(Map<String, dynamic> json) {
    return SkillTracking(
      id: json['id'],
      childId: json['childId'],
      skillName: json['skillName'],
      masteryLevel: json['masteryLevel'],
      consecutiveSuccesses: json['consecutiveSuccesses'],
      consecutiveFailures: json['consecutiveFailures'],
      totalAttempts: json['totalAttempts'],
      lastPracticed: json['lastPracticed'] != null
          ? DateTime.parse(json['lastPracticed'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'childId': childId,
      'skillName': skillName,
      'masteryLevel': masteryLevel,
      'consecutiveSuccesses': consecutiveSuccesses,
      'consecutiveFailures': consecutiveFailures,
      'totalAttempts': totalAttempts,
      'lastPracticed': lastPracticed?.toIso8601String(),
    };
  }

  double get masteryScore {
    switch (masteryLevel) {
      case 'mastered':
        return 1.0;
      case 'proficient':
        return 0.75;
      case 'developing':
        return 0.5;
      case 'novice':
        return 0.25;
      default:
        return 0;
    }
  }

  String get displayName {
    // Convert skill_name to readable format
    // e.g., "phonics_A" -> "Fonética: A"
    // "counting_1_10" -> "Conteo: 1-10"
    // "emotion_happy" -> "Emoción: Feliz"
    final parts = skillName.split('_');
    if (parts.length >= 2) {
      final category = parts[0];
      final detail = parts.sublist(1).join(' ');
      
      switch (category) {
        case 'phonics':
          return 'Fonética: $detail';
        case 'counting':
          return 'Conteo: $detail';
        case 'addition':
          return 'Suma: $detail';
        case 'subtraction':
          return 'Resta: $detail';
        case 'shape':
          return 'Forma: $detail';
        case 'pattern':
          return 'Patrón: $detail';
        case 'emotion':
          return 'Emoción: $detail';
        case 'empathy':
          return 'Empatía: $detail';
        case 'mindfulness':
          return 'Mindfulness: $detail';
        default:
          return skillName;
      }
    }
    return skillName;
  }
}
