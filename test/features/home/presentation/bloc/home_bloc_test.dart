import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/error/failures.dart';
import 'package:plant_app/core/usecases/usecase.dart';
import 'package:plant_app/features/home/domain/entities/category_entity.dart';
import 'package:plant_app/features/home/domain/entities/question_entity.dart';
import 'package:plant_app/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:plant_app/features/home/domain/usecases/get_questions_usecase.dart';
import 'package:plant_app/features/home/presentation/bloc/home_bloc.dart';

class MockGetCategoriesUseCase extends Mock implements GetCategoriesUseCase {}

class MockGetQuestionsUsecase extends Mock implements GetQuestionsUsecase {}

void main() {
  late MockGetCategoriesUseCase mockGetCategoriesUseCase;
  late MockGetQuestionsUsecase mockGetQuestionsUsecase;

  setUp(() {
    mockGetCategoriesUseCase = MockGetCategoriesUseCase();
    mockGetQuestionsUsecase = MockGetQuestionsUsecase();
  });

  setUpAll(() {
    registerFallbackValue(NoParams());
  });

  const tCategory = CategoryEntity(
    id: 1,
    name: 'test',
    title: 'Test Category',
    rank: 1,
    createdAt: '2024-01-01',
    updatedAt: '2024-01-01',
    publishedAt: '2024-01-01',
    image: CategoryImageEntity(id: 1, name: 'test.png', url: 'https://test.com/image.png'),
  );

  const tQuestion = QuestionEntity(
    id: 1,
    title: 'Test Question',
    subtitle: 'Test Subtitle',
    imageUri: 'https://test.com/question.png',
    uri: 'test-question',
    order: 1,
  );

  group('HomeBloc', () {
    test('initial state should have initial status', () {
      final bloc = HomeBloc(
        getCategoriesUseCase: mockGetCategoriesUseCase,
        getQuestionsUsecase: mockGetQuestionsUsecase,
      );

      expect(bloc.state.categoriesStatus, HomeDataStatus.initial);
      expect(bloc.state.questionsStatus, HomeDataStatus.initial);
      expect(bloc.state.categories, []);
      expect(bloc.state.questions, []);

      bloc.close();
    });

    blocTest<HomeBloc, HomeState>(
      'emits [loading, loaded] when LoadCategoriesEvent is successful',
      build: () {
        when(
          () => mockGetCategoriesUseCase(any()),
        ).thenAnswer((_) async => const Right([tCategory]));
        return HomeBloc(
          getCategoriesUseCase: mockGetCategoriesUseCase,
          getQuestionsUsecase: mockGetQuestionsUsecase,
        );
      },
      act: (bloc) => bloc.add(const LoadCategoriesEvent()),
      expect: () => [
        const HomeState(categoriesStatus: HomeDataStatus.loading),
        const HomeState(categoriesStatus: HomeDataStatus.loaded, categories: [tCategory]),
      ],
      verify: (_) {
        verify(() => mockGetCategoriesUseCase(NoParams())).called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'emits [loading, error] when LoadCategoriesEvent fails',
      build: () {
        when(
          () => mockGetCategoriesUseCase(any()),
        ).thenAnswer((_) async => const Left(ServerFailure('Server error')));
        return HomeBloc(
          getCategoriesUseCase: mockGetCategoriesUseCase,
          getQuestionsUsecase: mockGetQuestionsUsecase,
        );
      },
      act: (bloc) => bloc.add(const LoadCategoriesEvent()),
      expect: () => [
        const HomeState(categoriesStatus: HomeDataStatus.loading),
        const HomeState(categoriesStatus: HomeDataStatus.error, categoriesError: 'Server error'),
      ],
      verify: (_) {
        verify(() => mockGetCategoriesUseCase(NoParams())).called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'emits [loading, loaded] when LoadQuestionsEvent is successful',
      build: () {
        when(
          () => mockGetQuestionsUsecase(any()),
        ).thenAnswer((_) async => const Right([tQuestion]));
        return HomeBloc(
          getCategoriesUseCase: mockGetCategoriesUseCase,
          getQuestionsUsecase: mockGetQuestionsUsecase,
        );
      },
      act: (bloc) => bloc.add(const LoadQuestionsEvent()),
      expect: () => [
        const HomeState(questionsStatus: HomeDataStatus.loading),
        const HomeState(questionsStatus: HomeDataStatus.loaded, questions: [tQuestion]),
      ],
      verify: (_) {
        verify(() => mockGetQuestionsUsecase(NoParams())).called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'emits [loading, error] when LoadQuestionsEvent fails',
      build: () {
        when(
          () => mockGetQuestionsUsecase(any()),
        ).thenAnswer((_) async => const Left(NetworkFailure('Network error')));
        return HomeBloc(
          getCategoriesUseCase: mockGetCategoriesUseCase,
          getQuestionsUsecase: mockGetQuestionsUsecase,
        );
      },
      act: (bloc) => bloc.add(const LoadQuestionsEvent()),
      expect: () => [
        const HomeState(questionsStatus: HomeDataStatus.loading),
        const HomeState(questionsStatus: HomeDataStatus.error, questionsError: 'Network error'),
      ],
      verify: (_) {
        verify(() => mockGetQuestionsUsecase(NoParams())).called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'emits [loading, loaded] for both when LoadHomeDataEvent is successful',
      build: () {
        when(
          () => mockGetCategoriesUseCase(any()),
        ).thenAnswer((_) async => const Right([tCategory]));
        when(
          () => mockGetQuestionsUsecase(any()),
        ).thenAnswer((_) async => const Right([tQuestion]));
        return HomeBloc(
          getCategoriesUseCase: mockGetCategoriesUseCase,
          getQuestionsUsecase: mockGetQuestionsUsecase,
        );
      },
      act: (bloc) => bloc.add(const LoadHomeDataEvent()),
      expect: () => [
        const HomeState(
          categoriesStatus: HomeDataStatus.loading,
          questionsStatus: HomeDataStatus.loading,
        ),
        const HomeState(
          categoriesStatus: HomeDataStatus.loaded,
          categories: [tCategory],
          questionsStatus: HomeDataStatus.loaded,
          questions: [tQuestion],
        ),
      ],
      verify: (_) {
        verify(() => mockGetCategoriesUseCase(NoParams())).called(1);
        verify(() => mockGetQuestionsUsecase(NoParams())).called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'emits error for categories and loaded for questions when LoadHomeDataEvent partially fails',
      build: () {
        when(
          () => mockGetCategoriesUseCase(any()),
        ).thenAnswer((_) async => const Left(ServerFailure('Server error')));
        when(
          () => mockGetQuestionsUsecase(any()),
        ).thenAnswer((_) async => const Right([tQuestion]));
        return HomeBloc(
          getCategoriesUseCase: mockGetCategoriesUseCase,
          getQuestionsUsecase: mockGetQuestionsUsecase,
        );
      },
      act: (bloc) => bloc.add(const LoadHomeDataEvent()),
      expect: () => [
        const HomeState(
          categoriesStatus: HomeDataStatus.loading,
          questionsStatus: HomeDataStatus.loading,
        ),
        const HomeState(
          categoriesStatus: HomeDataStatus.error,
          categoriesError: 'Server error',
          questionsStatus: HomeDataStatus.loaded,
          questions: [tQuestion],
        ),
      ],
      verify: (_) {
        verify(() => mockGetCategoriesUseCase(NoParams())).called(1);
        verify(() => mockGetQuestionsUsecase(NoParams())).called(1);
      },
    );
  });

  group('HomeState', () {
    test('copyWith should copy with new values', () {
      const state = HomeState();
      final newState = state.copyWith(
        categoriesStatus: HomeDataStatus.loaded,
        categories: [tCategory],
      );

      expect(newState.categoriesStatus, HomeDataStatus.loaded);
      expect(newState.categories, [tCategory]);
      expect(newState.questionsStatus, HomeDataStatus.initial);
    });

    test('props should contain all fields', () {
      const state = HomeState(
        categoriesStatus: HomeDataStatus.loaded,
        categories: [tCategory],
        categoriesError: 'error',
        questionsStatus: HomeDataStatus.error,
        questions: [tQuestion],
        questionsError: 'question error',
      );

      expect(state.props, [
        HomeDataStatus.loaded,
        [tCategory],
        'error',
        HomeDataStatus.error,
        [tQuestion],
        'question error',
      ]);
    });
  });
}
