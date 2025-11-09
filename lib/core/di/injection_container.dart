import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:plant_app/core/network/api_service.dart';
import 'package:plant_app/core/network/dio_client.dart';
import 'package:plant_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:plant_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:plant_app/features/home/domain/repositories/home_repository.dart';
import 'package:plant_app/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:plant_app/features/home/domain/usecases/get_questions_usecase.dart';
import 'package:plant_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../router/app_router.dart';
import '../storage/local_storage_service.dart';

final GetIt getIt = GetIt.instance;

/// Initialize dependency injection
Future<void> initializeDependencies() async {
  // External dependencies
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Core services
  getIt.registerLazySingleton<LocalStorageService>(() => LocalStorageService(getIt()));

  // Router
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());

  // Network
  getIt.registerLazySingleton<Dio>(() => DioClient.createDio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt()));

  // Home Feature - Data sources
  getIt.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(apiService: getIt()));

  // Home Feature - Repositories
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(remoteDataSource: getIt()));

  // Home Feature - Use cases
  getIt.registerLazySingleton<GetCategoriesUseCase>(() => GetCategoriesUseCase(repository: getIt()));
  getIt.registerLazySingleton<GetQuestionsUsecase>(() => GetQuestionsUsecase(repository: getIt()));

  // Home Feature - BLoC
  getIt.registerFactory<HomeBloc>(() => HomeBloc(getCategoriesUseCase: getIt(), getQuestionsUsecase: getIt()));
}
