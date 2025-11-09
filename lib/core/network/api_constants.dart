class ApiConstants {
  static const String baseUrl = 'https://dummy-api-jtg6bessta-ey.a.run.app';
  static const String getCategories = '/getCategories';
  static const String getQuestions = '/getQuestions';

  // Timeout durations
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
