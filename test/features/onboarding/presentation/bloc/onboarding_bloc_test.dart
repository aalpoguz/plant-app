import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/error/failures.dart';
import 'package:plant_app/core/usecases/usecase.dart';
import 'package:plant_app/features/onboarding/domain/usecases/complete_onboarding_usecase.dart';
import 'package:plant_app/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:plant_app/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:plant_app/features/onboarding/presentation/bloc/onboarding_state.dart';

class MockCompleteOnboardingUseCase extends Mock implements CompleteOnboardingUseCase {}

void main() {
  late MockCompleteOnboardingUseCase mockCompleteOnboardingUseCase;

  setUp(() {
    mockCompleteOnboardingUseCase = MockCompleteOnboardingUseCase();
  });

  setUpAll(() {
    registerFallbackValue(NoParams());
  });

  group('OnboardingBloc', () {
    test('initial state should have currentPage = 0', () {
      final bloc = OnboardingBloc(completeOnboardingUseCase: mockCompleteOnboardingUseCase);

      expect(bloc.state.currentPage, 0);
      expect(bloc.state.status, OnboardingStatus.initial);

      bloc.close();
    });

    blocTest<OnboardingBloc, OnboardingState>(
      'emits updated currentPage when OnboardingPageChanged is added',
      build: () => OnboardingBloc(completeOnboardingUseCase: mockCompleteOnboardingUseCase),
      act: (bloc) => bloc.add(OnboardingPageChanged(2)),
      expect: () => [const OnboardingState(currentPage: 2, totalPages: 3)],
    );

    blocTest<OnboardingBloc, OnboardingState>(
      'emits [loading, completed] when OnboardingComplete succeeds',
      build: () {
        when(() => mockCompleteOnboardingUseCase(any())).thenAnswer((_) async => const Right(null));
        return OnboardingBloc(completeOnboardingUseCase: mockCompleteOnboardingUseCase);
      },
      act: (bloc) => bloc.add(OnboardingComplete()),
      expect: () => [const OnboardingState(currentPage: 0, totalPages: 3, status: OnboardingStatus.loading), const OnboardingState(currentPage: 0, totalPages: 3, status: OnboardingStatus.completed)],
      verify: (_) {
        verify(() => mockCompleteOnboardingUseCase(NoParams())).called(1);
      },
    );

    blocTest<OnboardingBloc, OnboardingState>(
      'emits [loading, error] when OnboardingComplete fails',
      build: () {
        when(() => mockCompleteOnboardingUseCase(any())).thenAnswer((_) async => const Left(CacheFailure('Cache error')));
        return OnboardingBloc(completeOnboardingUseCase: mockCompleteOnboardingUseCase);
      },
      act: (bloc) => bloc.add(OnboardingComplete()),
      expect: () => [const OnboardingState(currentPage: 0, totalPages: 3, status: OnboardingStatus.loading), const OnboardingState(currentPage: 0, totalPages: 3, status: OnboardingStatus.error, errorMessage: 'Cache error')],
      verify: (_) {
        verify(() => mockCompleteOnboardingUseCase(NoParams())).called(1);
      },
    );

    blocTest<OnboardingBloc, OnboardingState>(
      'does not emit new state when OnboardingTermsTapped is added',
      build: () => OnboardingBloc(completeOnboardingUseCase: mockCompleteOnboardingUseCase),
      act: (bloc) => bloc.add(OnboardingTermsTapped()),
      expect: () => [],
    );

    blocTest<OnboardingBloc, OnboardingState>(
      'does not emit new state when OnboardingPrivacyTapped is added',
      build: () => OnboardingBloc(completeOnboardingUseCase: mockCompleteOnboardingUseCase),
      act: (bloc) => bloc.add(OnboardingPrivacyTapped()),
      expect: () => [],
    );
  });

  group('OnboardingState', () {
    test('isFirstPage returns true when currentPage is 0', () {
      const state = OnboardingState(currentPage: 0, totalPages: 3);
      expect(state.isFirstPage, true);
    });

    test('isFirstPage returns false when currentPage is not 0', () {
      const state = OnboardingState(currentPage: 1, totalPages: 3);
      expect(state.isFirstPage, false);
    });

    test('isLastPage returns true when currentPage is totalPages - 1', () {
      const state = OnboardingState(currentPage: 2, totalPages: 3);
      expect(state.isLastPage, true);
    });

    test('isLastPage returns false when currentPage is not last', () {
      const state = OnboardingState(currentPage: 1, totalPages: 3);
      expect(state.isLastPage, false);
    });

    test('copyWith should copy with new values', () {
      const state = OnboardingState(currentPage: 0, totalPages: 3);
      final newState = state.copyWith(currentPage: 1, status: OnboardingStatus.loading);

      expect(newState.currentPage, 1);
      expect(newState.status, OnboardingStatus.loading);
      expect(newState.totalPages, 3);
    });

    test('props should contain all fields', () {
      const state = OnboardingState(currentPage: 1, totalPages: 3, status: OnboardingStatus.error, errorMessage: 'error');

      expect(state.props, [1, 3, OnboardingStatus.error, 'error']);
    });
  });
}
