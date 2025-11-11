// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [DiagnosePage]
class DiagnoseRoute extends PageRouteInfo<void> {
  const DiagnoseRoute({List<PageRouteInfo>? children})
    : super(DiagnoseRoute.name, initialChildren: children);

  static const String name = 'DiagnoseRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DiagnosePage();
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [MainShellPage]
class MainShellRoute extends PageRouteInfo<void> {
  const MainShellRoute({List<PageRouteInfo>? children})
    : super(MainShellRoute.name, initialChildren: children);

  static const String name = 'MainShellRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainShellPage();
    },
  );
}

/// generated route for
/// [MyGardenPage]
class MyGardenRoute extends PageRouteInfo<void> {
  const MyGardenRoute({List<PageRouteInfo>? children})
    : super(MyGardenRoute.name, initialChildren: children);

  static const String name = 'MyGardenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyGardenPage();
    },
  );
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingPage();
    },
  );
}

/// generated route for
/// [PaywallPage]
class PaywallRoute extends PageRouteInfo<void> {
  const PaywallRoute({List<PageRouteInfo>? children})
    : super(PaywallRoute.name, initialChildren: children);

  static const String name = 'PaywallRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PaywallPage();
    },
  );
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [QuestionDetailPage]
class QuestionDetailRoute extends PageRouteInfo<QuestionDetailRouteArgs> {
  QuestionDetailRoute({
    Key? key,
    required String title,
    required String imageUrl,
    required String uri,
    List<PageRouteInfo>? children,
  }) : super(
         QuestionDetailRoute.name,
         args: QuestionDetailRouteArgs(
           key: key,
           title: title,
           imageUrl: imageUrl,
           uri: uri,
         ),
         initialChildren: children,
       );

  static const String name = 'QuestionDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuestionDetailRouteArgs>();
      return QuestionDetailPage(
        key: args.key,
        title: args.title,
        imageUrl: args.imageUrl,
        uri: args.uri,
      );
    },
  );
}

class QuestionDetailRouteArgs {
  const QuestionDetailRouteArgs({
    this.key,
    required this.title,
    required this.imageUrl,
    required this.uri,
  });

  final Key? key;

  final String title;

  final String imageUrl;

  final String uri;

  @override
  String toString() {
    return 'QuestionDetailRouteArgs{key: $key, title: $title, imageUrl: $imageUrl, uri: $uri}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! QuestionDetailRouteArgs) return false;
    return key == other.key &&
        title == other.title &&
        imageUrl == other.imageUrl &&
        uri == other.uri;
  }

  @override
  int get hashCode =>
      key.hashCode ^ title.hashCode ^ imageUrl.hashCode ^ uri.hashCode;
}

/// generated route for
/// [ScanPage]
class ScanRoute extends PageRouteInfo<void> {
  const ScanRoute({List<PageRouteInfo>? children})
    : super(ScanRoute.name, initialChildren: children);

  static const String name = 'ScanRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ScanPage();
    },
  );
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
}
