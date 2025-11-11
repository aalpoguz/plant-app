part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadCategoriesEvent extends HomeEvent {
  const LoadCategoriesEvent();
}

class LoadQuestionsEvent extends HomeEvent {
  const LoadQuestionsEvent();
}

class LoadHomeDataEvent extends HomeEvent {
  const LoadHomeDataEvent();
}
