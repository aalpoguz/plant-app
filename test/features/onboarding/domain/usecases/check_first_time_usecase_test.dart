import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/error/failures.dart';
import 'package:plant_app/core/storage/storage_repository.dart';
import 'package:plant_app/core/usecases/usecase.dart';
import 'package:plant_app/features/onboarding/domain/usecases/check_first_time_usecase.dart';

class MockStorageRepository extends Mock implements StorageRepository {}

void main() {
  late CheckFirstTimeUseCase useCase;
  late MockStorageRepository mockRepository;

  setUp(() {
    mockRepository = MockStorageRepository();
    useCase = CheckFirstTimeUseCase(repository: mockRepository);
  });

  group('CheckFirstTimeUseCase', () {
    test('should return true when user is first time', () async {
      // Arrange
      when(() => mockRepository.isFirstTimeUser()).thenAnswer((_) async => const Right(true));

      // Act
      final result = await useCase(NoParams());

      // Assert
      expect(result, const Right(true));
      verify(() => mockRepository.isFirstTimeUser()).called(1);
    });

    test('should return false when user is not first time', () async {
      // Arrange
      when(() => mockRepository.isFirstTimeUser()).thenAnswer((_) async => const Right(false));

      // Act
      final result = await useCase(NoParams());

      // Assert
      expect(result, const Right(false));
      verify(() => mockRepository.isFirstTimeUser()).called(1);
    });

    test('should return CacheFailure when repository fails', () async {
      // Arrange
      const failure = CacheFailure('Storage error');
      when(() => mockRepository.isFirstTimeUser()).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(NoParams());

      // Assert
      expect(result, const Left(failure));
      verify(() => mockRepository.isFirstTimeUser()).called(1);
    });
  });
}
