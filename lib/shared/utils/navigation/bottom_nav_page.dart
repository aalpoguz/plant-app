import 'package:auto_route/auto_route.dart';
import '../router/app_router.dart';

/// Bottom Navigation bar için sayfa yönetimi
enum BottomNavPage {
  home('/home', 'home', 'Home', 'assets/svg/icons/home.svg'),
  diagnose('/diagnose', 'diagnose', 'Diagnose', 'assets/svg/icons/diagnose.svg'),
  myGarden('/my-garden', 'myGarden', 'My Garden', 'assets/svg/icons/my-garden.svg'),
  profile('/profile', 'profile', 'Profile', 'assets/svg/icons/profile.svg');

  const BottomNavPage(this.path, this.routeName, this.displayName, this.iconPath);

  final String path;
  final String routeName;
  final String displayName;
  final String iconPath;

  /// Sayfa route'unu döndürür
  PageRouteInfo get route {
    switch (this) {
      case BottomNavPage.home:
        return const HomeRoute();
      case BottomNavPage.diagnose:
        return const DiagnoseRoute();
      case BottomNavPage.myGarden:
        return const MyGardenRoute();
      case BottomNavPage.profile:
        return const ProfileRoute();
    }
  }

  /// Sayfa başlığını döndürür (displayName alias)
  String get label => displayName;

  /// Sayfa ikonu path'ini döndürür (iconPath alias)
  String get icon => iconPath;

  /// Index'ten enum değeri oluşturur
  static BottomNavPage fromIndex(int index) {
    return BottomNavPage.values[index];
  }

  /// Route name'den enum değeri oluşturur
  static BottomNavPage? fromRouteName(String routeName) {
    try {
      return BottomNavPage.values.firstWhere((page) => page.routeName == routeName);
    } catch (_) {
      return null;
    }
  }

  /// Path'den enum değeri oluşturur
  static BottomNavPage? fromPath(String path) {
    try {
      return BottomNavPage.values.firstWhere((page) => page.path == path);
    } catch (_) {
      return null;
    }
  }
}
