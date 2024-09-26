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
    HistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HistoryScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    NewHobbyRoute.name: (routeData) {
      final args = routeData.argsAs<NewHobbyRouteArgs>(
          orElse: () => const NewHobbyRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewHobbyScreen(
          key: args.key,
          hobby: args.hobby,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    OpenHobbyRoute.name: (routeData) {
      final args = routeData.argsAs<OpenHobbyRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OpenHobbyScreen(
          key: args.key,
          hobby: args.hobby,
          date: args.date,
        ),
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
/// [HistoryScreen]
class HistoryRoute extends PageRouteInfo<void> {
  const HistoryRoute({List<PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [NewHobbyScreen]
class NewHobbyRoute extends PageRouteInfo<NewHobbyRouteArgs> {
  NewHobbyRoute({
    Key? key,
    Hobby? hobby,
    List<PageRouteInfo>? children,
  }) : super(
          NewHobbyRoute.name,
          args: NewHobbyRouteArgs(
            key: key,
            hobby: hobby,
          ),
          initialChildren: children,
        );

  static const String name = 'NewHobbyRoute';

  static const PageInfo<NewHobbyRouteArgs> page =
      PageInfo<NewHobbyRouteArgs>(name);
}

class NewHobbyRouteArgs {
  const NewHobbyRouteArgs({
    this.key,
    this.hobby,
  });

  final Key? key;

  final Hobby? hobby;

  @override
  String toString() {
    return 'NewHobbyRouteArgs{key: $key, hobby: $hobby}';
  }
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
class OpenHobbyRoute extends PageRouteInfo<OpenHobbyRouteArgs> {
  OpenHobbyRoute({
    Key? key,
    required Hobby hobby,
    DateTime? date,
    List<PageRouteInfo>? children,
  }) : super(
          OpenHobbyRoute.name,
          args: OpenHobbyRouteArgs(
            key: key,
            hobby: hobby,
            date: date,
          ),
          initialChildren: children,
        );

  static const String name = 'OpenHobbyRoute';

  static const PageInfo<OpenHobbyRouteArgs> page =
      PageInfo<OpenHobbyRouteArgs>(name);
}

class OpenHobbyRouteArgs {
  const OpenHobbyRouteArgs({
    this.key,
    required this.hobby,
    this.date,
  });

  final Key? key;

  final Hobby hobby;

  final DateTime? date;

  @override
  String toString() {
    return 'OpenHobbyRouteArgs{key: $key, hobby: $hobby, date: $date}';
  }
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
