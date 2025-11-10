import 'package:dartz/dartz.dart';
import 'package:plant_app/core/error/failures.dart';
import 'package:plant_app/core/storage/storage_repository.dart';
import 'package:plant_app/core/usecases/usecase.dart';

class CheckFirstTimeUseCase implements UseCase<bool, NoParams> {
  final StorageRepository repository;

  CheckFirstTimeUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.isFirstTimeUser();
  }
}
