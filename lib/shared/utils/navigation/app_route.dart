import 'package:auto_route/auto_route.dart';
import '../router/app_router.dart';

/// Uygulama içindeki tüm route'lar için enum
enum AppRoute {
  onboarding('/onboarding', 'onboarding', 'Onboarding'),
  paywall('/paywall', 'paywall', 'Paywall'),
  mainShell('/', 'mainShell', 'Main'),
  home('/home', 'home', 'Home'),
  diagnose('/diagnose', 'diagnose', 'Diagnose'),
  myGarden('/my-garden', 'myGarden', 'My Garden'),
  profile('/profile', 'profile', 'Profile');

  const AppRoute(this.path, this.routeName, this.displayName);

  final String path;
  final String routeName;
  final String displayName;

  /// Route'u PageRouteInfo'ya dönüştürür
  PageRouteInfo get route {
    switch (this) {
      case AppRoute.onboarding:
        return const OnboardingRoute();
      case AppRoute.paywall:
        return const PaywallRoute();
      case AppRoute.mainShell:
        return const MainShellRoute();
      case AppRoute.home:
        return const HomeRoute();
      case AppRoute.diagnose:
        return const DiagnoseRoute();
      case AppRoute.myGarden:
        return const MyGardenRoute();
      case AppRoute.profile:
        return const ProfileRoute();
    }
  }

  /// Path'den enum değeri oluşturur
  static AppRoute? fromPath(String path) {
    try {
      return AppRoute.values.firstWhere((route) => route.path == path);
    } catch (_) {
      return null;
    }
  }

  /// Route name'den enum değeri oluşturur
  static AppRoute? fromRouteName(String routeName) {
    try {
      return AppRoute.values.firstWhere((route) => route.routeName == routeName);
    } catch (_) {
      return null;
    }
  }

  /// Bottom navigation route'u mu kontrol eder
  bool get isBottomNavRoute {
    return this == AppRoute.home || this == AppRoute.diagnose || this == AppRoute.myGarden || this == AppRoute.profile;
  }
}
