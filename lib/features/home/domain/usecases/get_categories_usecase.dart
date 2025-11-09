import 'package:plant_app/core/usecases/usecase.dart';
import 'package:plant_app/features/home/domain/entities/category_entity.dart';
import 'package:plant_app/features/home/domain/repositories/home_repository.dart';

class GetCategoriesUseCase implements UseCase<List<CategoryEntity>, NoParams> {
  final HomeRepository repository;

  GetCategoriesUseCase({required this.repository});

  @override
  Future<List<CategoryEntity>> call(NoParams params) async {
    return await repository.getCategories();
  }
}
