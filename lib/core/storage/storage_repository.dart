import 'package:dartz/dartz.dart';
import 'package:plant_app/core/error/failures.dart';

/// Abstract repository for local storage operations
abstract class StorageRepository {
  Future<Either<Failure, bool>> isFirstTimeUser();
  Future<Either<Failure, void>> setFirstTimeComplete();
  Future<Either<Failure, void>> resetFirstTime();

  Future<Either<Failure, bool>> hasPaywallBeenShown();
  Future<Either<Failure, void>> setPaywallShown();
}
