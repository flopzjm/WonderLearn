import 'api_client.dart';
import '../../config/constants.dart';

class Endpoints {
  // Auth
  static const String register = '/auth/register';
  static const String login = '/auth/login';
  static const String refresh = '/auth/refresh';
  
  // Children
  static const String children = '/children';
  static String child(String id) => '/children/$id';
  
  // Content
  static const String lessons = '/content/lessons';
  static String lesson(String id) => '/content/lessons/$id';
  static const String phonics = '/content/phonics';
  static const String sightWords = '/content/sight-words';
  static const String stories = '/content/stories';
  static const String math = '/content/math';
  static const String sel = '/content/sel';
  
  // Progress
  static const String progressEvents = '/progress/events';
  static String childProgress(String childId) => '/progress/$childId';
  
  // Parents
  static String dashboard(String childId) => '/parents/dashboard/$childId';
  static String timeLimit(String childId) => '/parents/settings/$childId/time-limit';
  static String weeklyReport(String childId) => '/parents/reports/$childId/weekly';
  
  // Sync
  static String sync(String childId) => '/sync/$childId';
  static String pendingSync(String childId) => '/sync/$childId/pending';
}

class ApiEndpoints {
  final ApiClient _client;
  
  ApiEndpoints(this._client);
  
  // Auth
  Future<Map<String, dynamic>> register(String email, String password) =>
      _client.post(Endpoints.register, body: {'email': email, 'password': password});
  
  Future<Map<String, dynamic>> login(String email, String password) =>
      _client.post(Endpoints.login, body: {'email': email, 'password': password});
  
  Future<Map<String, dynamic>> refreshTokens(String refreshToken) =>
      _client.post(Endpoints.refresh, body: {'refreshToken': refreshToken});
  
  // Children
  Future<Map<String, dynamic>> createChild(Map<String, dynamic> data) =>
      _client.post(Endpoints.children, body: data);
  
  Future<List<dynamic>> getChildren() async {
    final result = await _client.get(Endpoints.children);
    return result['data'] ?? [];
  }
  
  Future<Map<String, dynamic>> getChild(String id) =>
      _client.get(Endpoints.child(id));
  
  Future<Map<String, dynamic>> updateChild(String id, Map<String, dynamic> data) =>
      _client.patch(Endpoints.child(id), body: data);
  
  // Content
  Future<List<dynamic>> getLessons({String? module, int? difficulty}) async {
    final params = <String, String>{};
    if (module != null) params['module'] = module;
    if (difficulty != null) params['difficulty'] = difficulty.toString();
    final result = await _client.get(Endpoints.lessons, queryParams: params);
    return result['data'] ?? [];
  }
  
  Future<Map<String, dynamic>> getLesson(String id) =>
      _client.get(Endpoints.lesson(id));
  
  Future<List<dynamic>> getPhonics() async {
    final result = await _client.get(Endpoints.phonics);
    return result['data'] ?? [];
  }
  
  Future<List<dynamic>> getSightWords() async {
    final result = await _client.get(Endpoints.sightWords);
    return result['data'] ?? [];
  }
  
  Future<List<dynamic>> getStories({String? category}) async {
    final result = await _client.get(Endpoints.stories, queryParams: category != null ? {'category': category} : null);
    return result['data'] ?? [];
  }
  
  // Progress
  Future<Map<String, dynamic>> submitLessonProgress(Map<String, dynamic> data) =>
      _client.post(Endpoints.progressEvents, body: data);
  
  Future<Map<String, dynamic>> getChildProgress(String childId) =>
      _client.get(Endpoints.childProgress(childId));
  
  // Parents
  Future<Map<String, dynamic>> getDashboard(String childId) =>
      _client.get(Endpoints.dashboard(childId));
  
  Future<Map<String, dynamic>> updateTimeLimit(String childId, int timeLimit) =>
      _client.patch(Endpoints.timeLimit(childId), body: {'timeLimit': timeLimit});
  
  Future<Map<String, dynamic>> sendWeeklyReport(String childId) =>
      _client.post(Endpoints.weeklyReport(childId));
}
