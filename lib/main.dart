import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/core/di/injection_container.dart';
import 'package:plant_app/core/router/app_router.dart';
import 'package:plant_app/core/storage/local_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies
  await initializeDependencies();

  // Check onboarding status and navigate accordingly
  final localStorage = getIt<LocalStorageService>();
  final appRouter = getIt<AppRouter>();
  
  if (localStorage.isOnboardingComplete()) {
    // If onboarding is complete, navigate directly to home
    appRouter.replaceAll([const HomeRoute()]);
  }

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(debugShowCheckedModeBanner: false, routerConfig: _appRouter.config());
      },
    );
  }
}
