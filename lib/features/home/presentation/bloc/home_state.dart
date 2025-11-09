part of 'home_bloc.dart';

class HomeState extends Equatable {
  final HomeDataStatus categoriesStatus;
  final List<CategoryEntity> categories;
  final String? categoriesError;

  final HomeDataStatus questionsStatus;
  final List<QuestionEntity> questions;
  final String? questionsError;

  const HomeState({this.categoriesStatus = HomeDataStatus.initial, this.categories = const [], this.categoriesError, this.questionsStatus = HomeDataStatus.initial, this.questions = const [], this.questionsError});

  HomeState copyWith({HomeDataStatus? categoriesStatus, List<CategoryEntity>? categories, String? categoriesError, HomeDataStatus? questionsStatus, List<QuestionEntity>? questions, String? questionsError}) {
    return HomeState(
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      categories: categories ?? this.categories,
      categoriesError: categoriesError ?? this.categoriesError,
      questionsStatus: questionsStatus ?? this.questionsStatus,
      questions: questions ?? this.questions,
      questionsError: questionsError ?? this.questionsError,
    );
  }

  @override
  List<Object?> get props => [categoriesStatus, categories, categoriesError, questionsStatus, questions, questionsError];
}
