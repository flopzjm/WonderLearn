class AppConstants {
  // API
  static const String apiBaseUrl = 'http://localhost:3000/api/v1';
  static const String mockApiUrl = 'http://localhost:4010/api/v1';
  
  // Time limits
  static const int minTimeLimit = 15;
  static const int maxTimeLimit = 120;
  static const int defaultTimeLimit = 30;
  static const int extraTimeMinutes = 5;
  
  // Adaptive engine
  static const int consecutiveSuccessToIncrease = 3;
  static const int consecutiveFailureToDecrease = 3;
  static const int frustrationErrorThreshold = 5;
  static const int mindfulnessSuggestionMinutes = 15;
  
  // Lesson
  static const int minAge = 2;
  static const int maxAge = 8;
  static const int maxStarsPerLesson = 3;
  
  // Avatar types
  static const String avatarDragon = 'dragon';
  static const String avatarCat = 'cat';
  static const String avatarRobot = 'robot';
  
  // Modules
  static const String moduleWonderBooks = 'wonderbooks';
  static const String moduleWonderMath = 'wondermath';
  static const String moduleWonderGrow = 'wondergrow';
}
