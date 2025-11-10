import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/core/usecases/usecase.dart';
import 'package:plant_app/features/onboarding/domain/usecases/check_first_time_usecase.dart';
import 'package:plant_app/shared/theme/app_theme.dart';
import 'package:plant_app/shared/utils/di/injection_container.dart';
import 'package:plant_app/shared/utils/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies
  await initializeDependencies();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // Check if this is the first time the app is opened
  final checkFirstTimeUseCase = getIt<CheckFirstTimeUseCase>();
  final result = await checkFirstTimeUseCase(NoParams());

  final PageRouteInfo initialRoute = result.fold((failure) => const OnboardingRoute(), (isFirstTime) => isFirstTime ? const OnboardingRoute() : const MainShellRoute());

  runApp(MainApp(initialRoute: initialRoute));
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
