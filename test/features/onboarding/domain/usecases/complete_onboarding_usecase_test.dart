import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/error/failures.dart';
import 'package:plant_app/core/storage/storage_repository.dart';
import 'package:plant_app/core/usecases/usecase.dart';
import 'package:plant_app/features/onboarding/domain/usecases/complete_onboarding_usecase.dart';

class MockStorageRepository extends Mock implements StorageRepository {}

void main() {
  late CompleteOnboardingUseCase useCase;
  late MockStorageRepository mockRepository;

  setUp(() {
    mockRepository = MockStorageRepository();
    useCase = CompleteOnboardingUseCase(repository: mockRepository);
  });

  group('CompleteOnboardingUseCase', () {
    test('should complete onboarding successfully', () async {
      // Arrange
      when(() => mockRepository.setFirstTimeComplete()).thenAnswer((_) async => const Right(null));

      // Act
      final result = await useCase(NoParams());

      // Assert
      expect(result, const Right(null));
      verify(() => mockRepository.setFirstTimeComplete()).called(1);
    });

    test('should return CacheFailure when repository fails', () async {
      // Arrange
      const failure = CacheFailure('Storage error');
      when(() => mockRepository.setFirstTimeComplete()).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(NoParams());

      // Assert
      expect(result, const Left(failure));
      verify(() => mockRepository.setFirstTimeComplete()).called(1);
    });
  });
}
