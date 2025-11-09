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

// Her ikisini birden yüklemek için (opsiyonel)
class LoadHomeDataEvent extends HomeEvent {
  const LoadHomeDataEvent();
}
