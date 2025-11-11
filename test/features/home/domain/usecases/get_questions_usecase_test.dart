import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/error/failures.dart';
import 'package:plant_app/core/usecases/usecase.dart';
import 'package:plant_app/features/home/domain/entities/question_entity.dart';
import 'package:plant_app/features/home/domain/repositories/home_repository.dart';
import 'package:plant_app/features/home/domain/usecases/get_questions_usecase.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late GetQuestionsUsecase useCase;
  late MockHomeRepository mockRepository;

  setUp(() {
    mockRepository = MockHomeRepository();
    useCase = GetQuestionsUsecase(repository: mockRepository);
  });

  group('GetQuestionsUsecase', () {
    final tQuestions = [
      const QuestionEntity(
        id: 1,
        title: 'How to water?',
        subtitle: 'Learn about watering',
        imageUri: 'image1.jpg',
        uri: 'uri1',
        order: 1,
      ),
      const QuestionEntity(
        id: 2,
        title: 'How to fertilize?',
        subtitle: 'Learn about fertilizing',
        imageUri: 'image2.jpg',
        uri: 'uri2',
        order: 2,
      ),
    ];

    test('should get questions from repository', () async {
      // Arrange
      when(() => mockRepository.getQuestions()).thenAnswer((_) async => Right(tQuestions));

      // Act
      final result = await useCase(NoParams());

      // Assert
      expect(result, Right(tQuestions));
      verify(() => mockRepository.getQuestions()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ServerFailure when repository fails', () async {
      // Arrange
      const failure = ServerFailure('Server error');
      when(() => mockRepository.getQuestions()).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(NoParams());

      // Assert
      expect(result, const Left(failure));
      verify(() => mockRepository.getQuestions()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return NetworkFailure when there is no connection', () async {
      // Arrange
      const failure = NetworkFailure('No internet connection');
      when(() => mockRepository.getQuestions()).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(NoParams());

      // Assert
      expect(result, const Left(failure));
      verify(() => mockRepository.getQuestions()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
