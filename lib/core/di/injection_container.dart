import 'package:get_it/get_it.dart';
import 'package:plant_app/core/router/app_router.dart';
import 'package:plant_app/core/storage/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

/// Initialize dependency injection
Future<void> initializeDependencies() async {
  // External dependencies
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Core services
  getIt.registerLazySingleton<LocalStorageService>(() => LocalStorageService(getIt()));

  // Router
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
}
