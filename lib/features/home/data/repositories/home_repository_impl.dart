import 'package:plant_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:plant_app/features/home/domain/entities/category_entity.dart';
import 'package:plant_app/features/home/domain/entities/question_entity.dart';
import 'package:plant_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<CategoryEntity>> getCategories() async {
    try {
      final models = await remoteDataSource.getCategories();
      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<QuestionEntity>> getQuestions() async {
    try {
      final models = await remoteDataSource.getQuestions();
      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }
}
