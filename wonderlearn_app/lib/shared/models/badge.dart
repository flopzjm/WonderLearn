class Badge {
  final String id;
  final String name;
  final String title;
  final String description;
  final String iconUrl;
  final Map<String, dynamic> criteria;

  Badge({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.iconUrl,
    required this.criteria,
  });

  factory Badge.fromJson(Map<String, dynamic> json) {
    return Badge(
      id: json['id'],
      name: json['name'],
      title: json['title'],
      description: json['description'],
      iconUrl: json['iconUrl'],
      criteria: json['criteria'] is String
          ? Map<String, dynamic>.from(jsonDecode(json['criteria']))
          : json['criteria'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'description': description,
      'iconUrl': iconUrl,
      'criteria': criteria,
    };
  }

  String get emoji {
    switch (name) {
      case 'first_lesson':
        return '🎓';
      case 'streak_3':
        return '🔥';
      case 'phonics_master':
        return '📚';
      case 'math_wizard':
        return '🧮';
      case 'sel_champion':
        return '💚';
      case 'story_reader':
        return '📖';
      case 'pattern_pro':
        return '🔄';
      case 'breathing_pro':
        return '🧘';
      default:
        return '🏆';
    }
  }
}
