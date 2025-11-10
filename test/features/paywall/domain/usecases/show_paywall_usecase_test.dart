import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/error/failures.dart';
import 'package:plant_app/core/storage/storage_repository.dart';
import 'package:plant_app/core/usecases/usecase.dart';
import 'package:plant_app/features/paywall/domain/usecases/show_paywall_usecase.dart';

class MockStorageRepository extends Mock implements StorageRepository {}

void main() {
  late SetPaywallShownUseCase useCase;
  late MockStorageRepository mockRepository;

  setUp(() {
    mockRepository = MockStorageRepository();
    useCase = SetPaywallShownUseCase(repository: mockRepository);
  });

  setUpAll(() {
    registerFallbackValue(NoParams());
  });

  group('SetPaywallShownUseCase', () {
    test('should call repository.setPaywallShown and return success', () async {
      // Arrange
      when(() => mockRepository.setPaywallShown()).thenAnswer((_) async => const Right(null));

      // Act
      final result = await useCase(NoParams());

      // Assert
      expect(result, const Right(null));
      verify(() => mockRepository.setPaywallShown()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return CacheFailure when repository fails', () async {
      // Arrange
      const failure = CacheFailure('Failed to set paywall shown');
      when(() => mockRepository.setPaywallShown()).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(NoParams());

      // Assert
      expect(result, const Left(failure));
      verify(() => mockRepository.setPaywallShown()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
