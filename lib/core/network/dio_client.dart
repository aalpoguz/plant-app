import 'package:dio/dio.dart';
import 'package:plant_app/core/network/api_constants.dart';

class DioClient {
  static Dio createDio() {
    final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl, connectTimeout: ApiConstants.connectTimeout, receiveTimeout: ApiConstants.receiveTimeout, headers: {'Content-Type': 'application/json', 'Accept': 'application/json'}, responseType: ResponseType.json));

    return dio;
  }
}
