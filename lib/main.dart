import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/core/di/injection_container.dart';
import 'package:plant_app/core/router/app_router.dart';
import 'package:plant_app/core/storage/local_storage_service.dart';
import 'package:plant_app/shared/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies
  await initializeDependencies();

  // Check onboarding status
  final hasCompletedOnboarding = await getIt<LocalStorageService>().isOnboardingComplete();

  runApp(MainApp(initialRoute: hasCompletedOnboarding ? const MainShellRoute() : const OnboardingRoute()));
}

class MainApp extends StatelessWidget {
  final PageRouteInfo initialRoute;

  const MainApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          routerConfig: appRouter.config(deepLinkBuilder: (_) => DeepLink([initialRoute])),
        );
      },
    );
  }
}
