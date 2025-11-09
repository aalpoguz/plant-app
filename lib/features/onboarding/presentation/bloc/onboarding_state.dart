class OnboardingState {
  final int currentPage;
  final int totalPages;

  const OnboardingState({required this.currentPage, required this.totalPages});

  bool get isFirstPage => currentPage == 0;
  bool get isLastPage => currentPage == totalPages - 1;

  OnboardingState copyWith({int? currentPage, int? totalPages}) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}
