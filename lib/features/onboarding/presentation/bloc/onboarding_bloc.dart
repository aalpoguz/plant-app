import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/core/usecases/usecase.dart';
import 'package:plant_app/features/onboarding/data/onboarding_data.dart';
import 'package:plant_app/features/onboarding/domain/usecases/complete_onboarding_usecase.dart';
import 'package:plant_app/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:plant_app/features/onboarding/presentation/bloc/onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final PageController pageController = PageController();
  final CompleteOnboardingUseCase completeOnboardingUseCase;

  OnboardingBloc({required this.completeOnboardingUseCase})
    : super(
        OnboardingState(
          currentPage: 0,
          totalPages: OnboardingData.onboardingPages.length,
        ),
      ) {
    on<OnboardingPageChanged>(_onPageChanged);
    on<OnboardingNextPage>(_onNextPage);
    on<OnboardingComplete>(_onComplete);
    on<OnboardingTermsTapped>(_onTermsTapped);
    on<OnboardingPrivacyTapped>(_onPrivacyTapped);
  }

  void _onPageChanged(
    OnboardingPageChanged event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(currentPage: event.page));
  }

  void _onNextPage(OnboardingNextPage event, Emitter<OnboardingState> emit) {
    if (state.isLastPage) {
      add(OnboardingComplete());
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _onComplete(
    OnboardingComplete event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(status: OnboardingStatus.loading));

    final result = await completeOnboardingUseCase(NoParams());

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: OnboardingStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (_) => emit(state.copyWith(status: OnboardingStatus.completed)),
    );
  }

  void _onTermsTapped(
    OnboardingTermsTapped event,
    Emitter<OnboardingState> emit,
  ) {
    // TODO: Open Terms of Service
  }

  void _onPrivacyTapped(
    OnboardingPrivacyTapped event,
    Emitter<OnboardingState> emit,
  ) {
    // TODO: Open Privacy Policy
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
