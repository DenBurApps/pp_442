import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby/hobby.dart';
import 'package:pp_442/features/hobbies/presentation/home_screen.dart';
import 'package:pp_442/features/hobbies/presentation/new_hobby_screen.dart';
import 'package:pp_442/features/hobbies/presentation/open_hobby_screen.dart';
import 'package:pp_442/features/hobbies/presentation/history_screen.dart';
import 'package:pp_442/features/hobbies/presentation/stats_screen.dart';
import 'package:pp_442/features/hobbies/presentation/stopwatch_history_screen.dart';
import 'package:pp_442/features/hobbies/presentation/stopwatch_screen.dart';
import 'package:pp_442/features/onboarding/onboarding_screen.dart';
import 'package:pp_442/features/settings/screens/privacy_policy_screen.dart';
import 'package:pp_442/features/settings/screens/privacy_screen.dart';
import 'package:pp_442/features/settings/screens/settings_screen.dart';
import 'package:pp_442/features/settings/screens/splash_screen.dart';
import 'package:pp_442/features/settings/screens/terms_of_use_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: PrivacyRoute.page),
        AutoRoute(page: PrivacyPolicyRoute.page),
        AutoRoute(page: TermsOfUseRoute.page),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: NewHobbyRoute.page),
        AutoRoute(page: OpenHobbyRoute.page),
        AutoRoute(page: HistoryRoute.page),
        AutoRoute(page: StatsRoute.page),
        AutoRoute(page: StopwatchRoute.page),
        AutoRoute(page: StopwatchHistoryRoute.page),
      ];
}
