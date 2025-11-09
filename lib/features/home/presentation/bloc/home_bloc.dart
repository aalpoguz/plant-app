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

  HomeBloc({required this.getCategoriesUseCase, required this.getQuestionsUsecase}) : super(const HomeState()) {
    on<LoadCategoriesEvent>(_onLoadCategories);
    on<LoadQuestionsEvent>(_onLoadQuestions);
    on<LoadHomeDataEvent>(_onLoadHomeData);
  }

  Future<void> _onLoadCategories(LoadCategoriesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(categoriesStatus: HomeDataStatus.loading));

    try {
      final categories = await getCategoriesUseCase(NoParams());
      emit(state.copyWith(categoriesStatus: HomeDataStatus.loaded, categories: categories));
    } catch (e) {
      emit(state.copyWith(categoriesStatus: HomeDataStatus.error, categoriesError: e.toString()));
    }
  }

  Future<void> _onLoadQuestions(LoadQuestionsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(questionsStatus: HomeDataStatus.loading));

    try {
      final questions = await getQuestionsUsecase(NoParams());
      emit(state.copyWith(questionsStatus: HomeDataStatus.loaded, questions: questions));
    } catch (e) {
      emit(state.copyWith(questionsStatus: HomeDataStatus.error, questionsError: e.toString()));
    }
  }

  Future<void> _onLoadHomeData(LoadHomeDataEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(categoriesStatus: HomeDataStatus.loading, questionsStatus: HomeDataStatus.loading));

    try {
      final results = await Future.wait([getCategoriesUseCase(NoParams()), getQuestionsUsecase(NoParams())]);

      final categories = results[0] as List<CategoryEntity>;
      final questions = results[1] as List<QuestionEntity>;

      emit(state.copyWith(categoriesStatus: HomeDataStatus.loaded, categories: categories, questionsStatus: HomeDataStatus.loaded, questions: questions));
    } catch (e) {
      emit(state.copyWith(categoriesStatus: HomeDataStatus.error, categoriesError: e.toString(), questionsStatus: HomeDataStatus.error, questionsError: e.toString()));
    }
  }
}
