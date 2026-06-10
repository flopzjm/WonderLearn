class Lesson {
  final String id;
  final String moduleId;
  final String lessonType;
  final String title;
  final String description;
  final int difficulty;
  final int durationMin;
  final int orderIndex;
  final Map<String, dynamic> contentJson;
  final Map<String, dynamic> assetsJson;

  Lesson({
    required this.id,
    required this.moduleId,
    required this.lessonType,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.durationMin,
    required this.orderIndex,
    required this.contentJson,
    required this.assetsJson,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      moduleId: json['moduleId'],
      lessonType: json['lessonType'],
      title: json['title'],
      description: json['description'],
      difficulty: json['difficulty'],
      durationMin: json['durationMin'],
      orderIndex: json['orderIndex'],
      contentJson: json['contentJson'] is String
          ? Map<String, dynamic>.from(jsonDecode(json['contentJson']))
          : json['contentJson'],
      assetsJson: json['assetsJson'] is String
          ? Map<String, dynamic>.from(jsonDecode(json['assetsJson']))
          : json['assetsJson'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'moduleId': moduleId,
      'lessonType': lessonType,
      'title': title,
      'description': description,
      'difficulty': difficulty,
      'durationMin': durationMin,
      'orderIndex': orderIndex,
      'contentJson': contentJson,
      'assetsJson': assetsJson,
    };
  }

  bool get isPhonics => lessonType == 'phonics';
  bool get isSightWord => lessonType == 'sight_word';
  bool get isStory => lessonType == 'story';
  bool get isCounting => lessonType == 'counting';
  bool get isAddition => lessonType == 'addition';
  bool get isShape => lessonType == 'shape';
  bool get isPattern => lessonType == 'pattern';
  bool get isEmotion => lessonType == 'emotion';
  bool get isEmpathy => lessonType == 'empathy';
  bool get isMindfulness => lessonType == 'mindfulness';

  String get moduleDisplayName {
    switch (moduleId) {
      case 'wonderbooks':
        return 'Lectura';
      case 'wondermath':
        return 'Matemáticas';
      case 'wondergrow':
        return 'Emociones';
      default:
        return moduleId;
    }
  }
}
