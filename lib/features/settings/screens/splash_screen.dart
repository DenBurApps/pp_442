import 'dart:async';
import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:is_first_run/is_first_run.dart';
import '../../../config/router/router.dart';
import '../dialogs/dialog_manager.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // late ConfigService _configService;
  // TODO uncomment while building
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // _configService = context.read<ConfigService>();
      // TODO uncomment while building
      await _checkConnectivity(
        () async => await DialogManager.showNoInternetDialog(context),
      );
      _navigate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }

  Future<void> _checkConnectivity(Future<void> Function() callback) async {
    final connectivity = Connectivity();
    late List<ConnectivityResult> result;
    try {
      result = await connectivity.checkConnectivity();
      if (result.contains(ConnectivityResult.none)) {
        await callback.call();
        return;
      }
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status', error: e);
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }
  }

  Future<void> _navigate() async {
    final router = context.router;
    // final usePrivacy = _configService.usePrivacy;
    // final link = _configService.link;
    // TODO uncomment while building

    late bool usePrivacy = true;
    const link = 'https://yandex.ru';
    // TODO remove while building

    await IsFirstRun.isFirstRun().then(
      (isFirstRun) async {
        if (isFirstRun) {
          InAppReview.instance.requestReview();
        }
        if (usePrivacy) {
          if (isFirstRun) {
            router.replace(const OnboardingRoute());
          } else {
            router.replace(const HomeRoute());
          }
        } else {
          router.replace(PrivacyRoute(link: link));
        }

        FlutterNativeSplash.remove();
      },
    );
  }
}
