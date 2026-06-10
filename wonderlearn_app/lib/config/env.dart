enum Environment { dev, staging, production }

class EnvConfig {
  static Environment _environment = Environment.dev;
  
  static void init(Environment environment) {
    _environment = environment;
  }
  
  static Environment get environment => _environment;
  
  static String get apiBaseUrl {
    switch (_environment) {
      case Environment.dev:
        return 'http://localhost:3000/api/v1';
      case Environment.staging:
        return 'https://staging-api.wonderlearn.app/api/v1';
      case Environment.production:
        return 'https://api.wonderlearn.app/api/v1';
    }
  }
  
  static bool get useMockApi => _environment == Environment.dev;
}
