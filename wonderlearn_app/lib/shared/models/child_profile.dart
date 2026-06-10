class ChildProfile {
  final String id;
  final String parentId;
  final String name;
  final int age;
  final String avatarType;
  final String avatarCustomization;
  final int levelGlobal;
  final int dailyTimeLimit;
  final DateTime createdAt;

  ChildProfile({
    required this.id,
    required this.parentId,
    required this.name,
    required this.age,
    required this.avatarType,
    required this.avatarCustomization,
    required this.levelGlobal,
    required this.dailyTimeLimit,
    required this.createdAt,
  });

  factory ChildProfile.fromJson(Map<String, dynamic> json) {
    return ChildProfile(
      id: json['id'],
      parentId: json['parentId'],
      name: json['name'],
      age: json['age'],
      avatarType: json['avatarType'],
      avatarCustomization: json['avatarCustomization'],
      levelGlobal: json['levelGlobal'],
      dailyTimeLimit: json['dailyTimeLimit'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parentId': parentId,
      'name': name,
      'age': age,
      'avatarType': avatarType,
      'avatarCustomization': avatarCustomization,
      'levelGlobal': levelGlobal,
      'dailyTimeLimit': dailyTimeLimit,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  String get avatarEmoji {
    switch (avatarType) {
      case 'dragon':
        return '🐲';
      case 'cat':
        return '🐱';
      case 'robot':
        return '🤖';
      default:
        return '🐲';
    }
  }
}
