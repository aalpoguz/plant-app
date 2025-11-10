import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:plant_app/core/network/dio_client.dart';
import 'package:plant_app/core/network/interceptors/auth_interceptor.dart';
import 'package:plant_app/core/network/interceptors/logging_interceptor.dart';
import 'package:plant_app/core/storage/storage_repository.dart';
import 'package:plant_app/core/storage/storage_repository_impl.dart';
import 'package:plant_app/core/usecases/set_paywall_shown_usecase.dart';
import 'package:plant_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:plant_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:plant_app/features/home/domain/repositories/home_repository.dart';
import 'package:plant_app/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:plant_app/features/home/domain/usecases/get_questions_usecase.dart';
import 'package:plant_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:plant_app/features/onboarding/domain/usecases/check_first_time_usecase.dart';
import 'package:plant_app/features/onboarding/domain/usecases/complete_onboarding_usecase.dart';
import 'package:plant_app/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:plant_app/shared/presentation/bloc/theme/theme_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../router/app_router.dart';
import 'package:plant_app/core/storage/local_storage_service.dart';

final GetIt getIt = GetIt.instance;

/// Initialize dependency injection
Future<void> initializeDependencies() async {
  // Dio
  final dio = Dio();
  dio.interceptors.addAll([AuthInterceptor(), LoggingInterceptor()]);

  // External dependencies
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Core services
  getIt.registerLazySingleton<LocalStorageService>(
    () => LocalStorageService(getIt()),
  );

  // Core - Storage Repository
  getIt.registerLazySingleton<StorageRepository>(
    () => StorageRepositoryImpl(localStorageService: getIt()),
  );

  // Router
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());

  // Network
  getIt.registerLazySingleton(() => dio);
  getIt.registerLazySingleton(() => DioClient(getIt()));

  // Home Feature - Data sources
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(dioClient: getIt()),
  );

  // Home Feature - Repositories
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: getIt()),
  );

  // Home Feature - Use cases
  getIt.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(repository: getIt()),
  );
  getIt.registerLazySingleton<GetQuestionsUsecase>(
    () => GetQuestionsUsecase(repository: getIt()),
  );

  // Home Feature - BLoC
  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(getCategoriesUseCase: getIt(), getQuestionsUsecase: getIt()),
  );

  // Onboarding Feature - Use cases
  getIt.registerLazySingleton<CheckFirstTimeUseCase>(
    () => CheckFirstTimeUseCase(repository: getIt()),
  );
  getIt.registerLazySingleton<CompleteOnboardingUseCase>(
    () => CompleteOnboardingUseCase(repository: getIt()),
  );

  // Onboarding Feature - BLoC
  getIt.registerFactory<OnboardingBloc>(
    () => OnboardingBloc(completeOnboardingUseCase: getIt()),
  );

  // Paywall Feature - Use cases
  getIt.registerLazySingleton<SetPaywallShownUseCase>(
    () => SetPaywallShownUseCase(repository: getIt()),
  );

  // Theme BLoC
  getIt.registerLazySingleton<ThemeBloc>(() => ThemeBloc(getIt()));
}
