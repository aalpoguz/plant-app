import 'package:equatable/equatable.dart';

enum OnboardingStatus { initial, loading, completed, error }

class OnboardingState extends Equatable {
  final int currentPage;
  final int totalPages;
  final OnboardingStatus status;
  final String? errorMessage;

  const OnboardingState({
    required this.currentPage,
    required this.totalPages,
    this.status = OnboardingStatus.initial,
    this.errorMessage,
  });

  bool get isFirstPage => currentPage == 0;
  bool get isLastPage => currentPage == totalPages - 1;

  OnboardingState copyWith({
    int? currentPage,
    int? totalPages,
    OnboardingStatus? status,
    String? errorMessage,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [currentPage, totalPages, status, errorMessage];
}
