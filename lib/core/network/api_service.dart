import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  /// GET request
  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParameters, options: options);
      return response;
    } on DioException {
      rethrow;
    }
  }

  /// POST request
  Future<Response> post(String endpoint, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final response = await _dio.post(endpoint, data: data, queryParameters: queryParameters, options: options);
      return response;
    } on DioException {
      rethrow;
    }
  }

  /// PUT request
  Future<Response> put(String endpoint, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final response = await _dio.put(endpoint, data: data, queryParameters: queryParameters, options: options);
      return response;
    } on DioException {
      rethrow;
    }
  }

  /// DELETE request
  Future<Response> delete(String endpoint, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final response = await _dio.delete(endpoint, data: data, queryParameters: queryParameters, options: options);
      return response;
    } on DioException {
      rethrow;
    }
  }

  /// PATCH request
  Future<Response> patch(String endpoint, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final response = await _dio.patch(endpoint, data: data, queryParameters: queryParameters, options: options);
      return response;
    } on DioException {
      rethrow;
    }
  }
}
