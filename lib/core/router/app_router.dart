import 'package:auto_route/auto_route.dart';
import 'package:plant_app/features/home/presentation/pages/home_page.dart';
import 'package:plant_app/features/onboarding/presentation/pages/onboarding_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // Onboarding Route
    AutoRoute(page: OnboardingRoute.page, initial: true),

    // Home Route
    AutoRoute(page: HomeRoute.page),
  ];
}
