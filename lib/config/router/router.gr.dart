// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    NewHobbyFirstRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewHobbyFirstScreen(),
      );
    },
    NewHobbySecondRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewHobbySecondScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    OpenHobbyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OpenHobbyScreen(),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacyPolicyScreen(),
      );
    },
    PrivacyRoute.name: (routeData) {
      final args = routeData.argsAs<PrivacyRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PrivacyScreen(
          key: args.key,
          link: args.link,
        ),
      );
    },
    SeeAllHobbiesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SeeAllHobbiesScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    StatsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StatsScreen(),
      );
    },
    StopwatchHistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StopwatchHistoryScreen(),
      );
    },
    StopwatchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StopwatchScreen(),
      );
    },
    TermsOfUseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TermsOfUseScreen(),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewHobbyFirstScreen]
class NewHobbyFirstRoute extends PageRouteInfo<void> {
  const NewHobbyFirstRoute({List<PageRouteInfo>? children})
      : super(
          NewHobbyFirstRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewHobbyFirstRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewHobbySecondScreen]
class NewHobbySecondRoute extends PageRouteInfo<void> {
  const NewHobbySecondRoute({List<PageRouteInfo>? children})
      : super(
          NewHobbySecondRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewHobbySecondRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OpenHobbyScreen]
class OpenHobbyRoute extends PageRouteInfo<void> {
  const OpenHobbyRoute({List<PageRouteInfo>? children})
      : super(
          OpenHobbyRoute.name,
          initialChildren: children,
        );

  static const String name = 'OpenHobbyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrivacyPolicyScreen]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrivacyScreen]
class PrivacyRoute extends PageRouteInfo<PrivacyRouteArgs> {
  PrivacyRoute({
    Key? key,
    required String link,
    List<PageRouteInfo>? children,
  }) : super(
          PrivacyRoute.name,
          args: PrivacyRouteArgs(
            key: key,
            link: link,
          ),
          initialChildren: children,
        );

  static const String name = 'PrivacyRoute';

  static const PageInfo<PrivacyRouteArgs> page =
      PageInfo<PrivacyRouteArgs>(name);
}

class PrivacyRouteArgs {
  const PrivacyRouteArgs({
    this.key,
    required this.link,
  });

  final Key? key;

  final String link;

  @override
  String toString() {
    return 'PrivacyRouteArgs{key: $key, link: $link}';
  }
}

/// generated route for
/// [SeeAllHobbiesScreen]
class SeeAllHobbiesRoute extends PageRouteInfo<void> {
  const SeeAllHobbiesRoute({List<PageRouteInfo>? children})
      : super(
          SeeAllHobbiesRoute.name,
          initialChildren: children,
        );

  static const String name = 'SeeAllHobbiesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StatsScreen]
class StatsRoute extends PageRouteInfo<void> {
  const StatsRoute({List<PageRouteInfo>? children})
      : super(
          StatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StopwatchHistoryScreen]
class StopwatchHistoryRoute extends PageRouteInfo<void> {
  const StopwatchHistoryRoute({List<PageRouteInfo>? children})
      : super(
          StopwatchHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'StopwatchHistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StopwatchScreen]
class StopwatchRoute extends PageRouteInfo<void> {
  const StopwatchRoute({List<PageRouteInfo>? children})
      : super(
          StopwatchRoute.name,
          initialChildren: children,
        );

  static const String name = 'StopwatchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TermsOfUseScreen]
class TermsOfUseRoute extends PageRouteInfo<void> {
  const TermsOfUseRoute({List<PageRouteInfo>? children})
      : super(
          TermsOfUseRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsOfUseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
