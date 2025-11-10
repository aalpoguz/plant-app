import 'package:auto_route/auto_route.dart';
import '../../../features/diagnose/diagnose_page.dart';
import '../../../features/home/presentation/pages/home_page.dart';
import '../../main/presentation/pages/main_shell_page.dart';
import '../../../features/my_garden/my_garden_page.dart';
import '../../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../../features/paywall/presentation/pages/paywall_page.dart';
import '../../../features/profile/profile_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, path: '/onboarding'),
    CustomRoute(
      page: PaywallRoute.page,
      path: '/paywall',
      fullscreenDialog: true,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      durationInMilliseconds: 400,
    ),
    AutoRoute(
      page: MainShellRoute.page,
      path: '/',
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home'),
        AutoRoute(page: DiagnoseRoute.page, path: 'diagnose'),
        AutoRoute(page: MyGardenRoute.page, path: 'my-garden'),
        AutoRoute(page: ProfileRoute.page, path: 'profile'),
      ],
    ),
  ];
}
