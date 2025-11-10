import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/error/failures.dart';
import 'package:plant_app/core/usecases/usecase.dart';
import 'package:plant_app/features/home/domain/entities/category_entity.dart';
import 'package:plant_app/features/home/domain/repositories/home_repository.dart';
import 'package:plant_app/features/home/domain/usecases/get_categories_usecase.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late GetCategoriesUseCase useCase;
  late MockHomeRepository mockRepository;

  setUp(() {
    mockRepository = MockHomeRepository();
    useCase = GetCategoriesUseCase(repository: mockRepository);
  });

  group('GetCategoriesUseCase', () {
    final tCategories = [
      const CategoryEntity(
        id: 1,
        name: 'Indoor Plants',
        title: 'Indoor',
        rank: 1,
        createdAt: '2024-01-01',
        updatedAt: '2024-01-01',
        publishedAt: '2024-01-01',
        image: CategoryImageEntity(id: 1, name: 'icon1', url: 'url1'),
      ),
      const CategoryEntity(
        id: 2,
        name: 'Outdoor Plants',
        title: 'Outdoor',
        rank: 2,
        createdAt: '2024-01-01',
        updatedAt: '2024-01-01',
        publishedAt: '2024-01-01',
        image: CategoryImageEntity(id: 2, name: 'icon2', url: 'url2'),
      ),
    ];

    test('should get categories from repository', () async {
      // Arrange
      when(() => mockRepository.getCategories()).thenAnswer((_) async => Right(tCategories));

      // Act
      final result = await useCase(NoParams());

      // Assert
      expect(result, Right(tCategories));
      verify(() => mockRepository.getCategories()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ServerFailure when repository fails', () async {
      // Arrange
      const failure = ServerFailure('Server error');
      when(() => mockRepository.getCategories()).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(NoParams());

      // Assert
      expect(result, const Left(failure));
      verify(() => mockRepository.getCategories()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return NetworkFailure when there is no connection', () async {
      // Arrange
      const failure = NetworkFailure('No internet connection');
      when(() => mockRepository.getCategories()).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(NoParams());

      // Assert
      expect(result, const Left(failure));
      verify(() => mockRepository.getCategories()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
