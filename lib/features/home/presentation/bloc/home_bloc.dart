import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/core/usecases/usecase.dart';
import 'package:plant_app/features/home/domain/entities/category_entity.dart';
import 'package:plant_app/features/home/domain/entities/question_entity.dart';
import 'package:plant_app/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:plant_app/features/home/domain/usecases/get_questions_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

enum HomeDataStatus { initial, loading, loaded, error }

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetQuestionsUsecase getQuestionsUsecase;

  HomeBloc({
    required this.getCategoriesUseCase,
    required this.getQuestionsUsecase,
  }) : super(const HomeState()) {
    on<LoadCategoriesEvent>(_onLoadCategories);
    on<LoadQuestionsEvent>(_onLoadQuestions);
    on<LoadHomeDataEvent>(_onLoadHomeData);
  }

  Future<void> _onLoadCategories(
    LoadCategoriesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(categoriesStatus: HomeDataStatus.loading));

    final result = await getCategoriesUseCase(NoParams());

    result.fold(
      (failure) => emit(
        state.copyWith(
          categoriesStatus: HomeDataStatus.error,
          categoriesError: failure.message,
        ),
      ),
      (categories) => emit(
        state.copyWith(
          categoriesStatus: HomeDataStatus.loaded,
          categories: categories,
        ),
      ),
    );
  }

  Future<void> _onLoadQuestions(
    LoadQuestionsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(questionsStatus: HomeDataStatus.loading));

    final result = await getQuestionsUsecase(NoParams());

    result.fold(
      (failure) => emit(
        state.copyWith(
          questionsStatus: HomeDataStatus.error,
          questionsError: failure.message,
        ),
      ),
      (questions) => emit(
        state.copyWith(
          questionsStatus: HomeDataStatus.loaded,
          questions: questions,
        ),
      ),
    );
  }

  Future<void> _onLoadHomeData(
    LoadHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        categoriesStatus: HomeDataStatus.loading,
        questionsStatus: HomeDataStatus.loading,
      ),
    );

    final results = await Future.wait([
      getCategoriesUseCase(NoParams()),
      getQuestionsUsecase(NoParams()),
    ]);

    final categoriesResult = results[0];
    final questionsResult = results[1];

    // Handle categories result
    String? categoriesError;
    List<CategoryEntity>? categories;
    var categoriesStatus = HomeDataStatus.loaded;

    categoriesResult.fold((failure) {
      categoriesError = failure.message;
      categoriesStatus = HomeDataStatus.error;
    }, (data) => categories = data as List<CategoryEntity>);

    // Handle questions result
    String? questionsError;
    List<QuestionEntity>? questions;
    var questionsStatus = HomeDataStatus.loaded;

    questionsResult.fold((failure) {
      questionsError = failure.message;
      questionsStatus = HomeDataStatus.error;
    }, (data) => questions = data as List<QuestionEntity>);

    emit(
      state.copyWith(
        categoriesStatus: categoriesStatus,
        categories: categories,
        categoriesError: categoriesError,
        questionsStatus: questionsStatus,
        questions: questions,
        questionsError: questionsError,
      ),
    );
  }
}
