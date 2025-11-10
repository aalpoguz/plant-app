import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:plant_app/core/error/exceptions.dart';
import 'package:plant_app/core/network/api_constants.dart';
import 'package:plant_app/core/network/dio_client.dart';
import 'package:plant_app/features/home/data/models/category_model.dart';
import 'package:plant_app/features/home/data/models/question_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<QuestionModel>> getQuestions();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioClient dioClient;

  HomeRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await dioClient.get(ApiConstants.getCategories);

      if (response.statusCode == 200) {
        final responseData = _parseResponseData(response.data);
        final data = _extractDataList(responseData);

        if (data.isEmpty) return [];

        return data.map((item) => CategoryModel.fromJson(item as Map<String, dynamic>)).toList();
      } else {
        throw ServerException(message: 'Failed to load categories: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw ServerException(message: e.response?.data?['message'] ?? e.message ?? 'Server error occurred');
    } catch (e) {
      throw ServerException(message: 'Unexpected error: $e');
    }
  }

  @override
  Future<List<QuestionModel>> getQuestions() async {
    try {
      final response = await dioClient.get(ApiConstants.getQuestions);

      if (response.statusCode == 200) {
        final responseData = _parseResponseData(response.data);
        final data = _extractDataList(responseData);

        if (data.isEmpty) return [];

        return data.map((item) => QuestionModel.fromJson(item as Map<String, dynamic>)).toList();
      } else {
        throw ServerException(message: 'Failed to load questions: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw ServerException(message: e.response?.data?['message'] ?? e.message ?? 'Server error occurred');
    } catch (e) {
      throw ServerException(message: 'Unexpected error: $e');
    }
  }

  dynamic _parseResponseData(dynamic data) {
    if (data is String) {
      return jsonDecode(data);
    }
    return data;
  }

  /// Extract list data from response
  List _extractDataList(dynamic responseData) {
    if (responseData is Map && responseData.containsKey('data')) {
      final data = responseData['data'];
      if (data is List) {
        return data;
      } else {
        throw ServerException(message: 'Data field is not a list');
      }
    } else if (responseData is List) {
      return responseData;
    } else {
      throw ServerException(message: 'Unexpected response format: ${responseData.runtimeType}');
    }
  }
}
