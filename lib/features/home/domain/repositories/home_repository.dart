import 'package:plant_app/features/home/domain/entities/category_entity.dart';
import 'package:plant_app/features/home/domain/entities/question_entity.dart';

/// Abstract repository interface for home feature
abstract class HomeRepository {
  Future<List<CategoryEntity>> getCategories();
  Future<List<QuestionEntity>> getQuestions();
}
