import 'package:dartz/dartz.dart';
import 'package:plant_app/core/error/failures.dart';
import 'package:plant_app/core/storage/storage_repository.dart';
import 'package:plant_app/core/usecases/usecase.dart';

class CompleteOnboardingUseCase implements UseCase<void, NoParams> {
  final StorageRepository repository;

  CompleteOnboardingUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.setFirstTimeComplete();
  }
}
