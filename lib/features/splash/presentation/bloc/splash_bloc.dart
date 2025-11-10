import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/core/storage/local_storage_service.dart';
import 'package:plant_app/features/splash/presentation/bloc/splash_event.dart';
import 'package:plant_app/features/splash/presentation/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final LocalStorageService _storageService;

  SplashBloc({required LocalStorageService storageService}) : _storageService = storageService, super(const SplashState()) {
    on<SplashInitialized>(_onInitialized);
    on<SplashAnimationCompleted>(_onAnimationCompleted);
  }

  Future<void> _onInitialized(SplashInitialized event, Emitter<SplashState> emit) async {
    emit(state.copyWith(status: SplashStatus.animating));
  }

  Future<void> _onAnimationCompleted(SplashAnimationCompleted event, Emitter<SplashState> emit) async {
    // Check if onboarding is complete

    final isOnboardingComplete = _storageService.isOnboardingComplete();

    if (isOnboardingComplete) {
      emit(state.copyWith(status: SplashStatus.navigatingToHome));
    } else {
      emit(state.copyWith(status: SplashStatus.navigatingToOnboarding));
    }
  }
}
