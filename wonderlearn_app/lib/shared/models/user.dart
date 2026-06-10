class User {
  final String id;
  final String email;
  final String authProvider;
  final bool emailVerified;
  final DateTime createdAt;

  User({
    required this.id,
    required this.email,
    required this.authProvider,
    required this.emailVerified,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      authProvider: json['authProvider'],
      emailVerified: json['emailVerified'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'authProvider': authProvider,
      'emailVerified': emailVerified,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
