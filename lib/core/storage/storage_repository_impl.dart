import 'package:dartz/dartz.dart';
import 'package:plant_app/core/error/failures.dart';
import 'package:plant_app/core/storage/storage_repository.dart';
import 'package:plant_app/core/storage/local_storage_service.dart';

class StorageRepositoryImpl implements StorageRepository {
  final LocalStorageService localStorageService;

  StorageRepositoryImpl({required this.localStorageService});

  @override
  Future<Either<Failure, bool>> isFirstTimeUser() async {
    try {
      final isFirstTime = !localStorageService.isOnboardingComplete();
      return Right(isFirstTime);
    } catch (e) {
      return Left(CacheFailure('Failed to check first time status: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> setFirstTimeComplete() async {
    try {
      await localStorageService.setOnboardingComplete();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to set first time complete: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> resetFirstTime() async {
    try {
      await localStorageService.resetOnboarding();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to reset first time: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> hasPaywallBeenShown() async {
    try {
      final hasBeenShown = localStorageService.hasPaywallBeenShown();
      return Right(hasBeenShown);
    } catch (e) {
      return Left(CacheFailure('Failed to check paywall status: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> setPaywallShown() async {
    try {
      await localStorageService.setPaywallShown();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to set paywall shown: $e'));
    }
  }
}
