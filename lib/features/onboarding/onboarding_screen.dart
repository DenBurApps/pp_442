import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pp_442/config/router/router.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/ui/custom_button.dart';
import 'package:pp_442/core/ui/section.dart';
import 'package:pp_442/features/onboarding/indicator.dart';
import 'package:pp_442/gen/assets.gen.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onboardingPages = <Widget>[
      Section(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome !',
              style: context.text.displayLarge.copyWith(
                color: context.colors.onPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Organize your hobbies and creative projects',
              style: context.text.displayMedium.copyWith(
                color: context.colors.onPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Image.asset(Assets.images.onboarding.a1.path),
            ),
          ],
        ),
      ),
      Section(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'HobbyManager is your personal hobby manager',
              style: context.text.displayMedium.copyWith(
                color: context.colors.onPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Image.asset(Assets.images.onboarding.a2.path),
            ),
          ],
        ),
      ),
      Section(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Start managing your hobbies today!',
              style: context.text.displayMedium.copyWith(
                color: context.colors.onPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Image.asset(Assets.images.onboarding.a3.path),
            ),
          ],
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Indicator(
              currPage: _currentPage,
              totalPages: onboardingPages.length,
            ),
            const SizedBox(height: 50),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: onboardingPages,
              ),
            ),
            const SizedBox(height: 80),
            Section(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CustomButton.title(
                    title: _currentPage != onboardingPages.length - 1
                        ? 'Next'
                        : 'Start',
                    onPressed: () {
                      if (_currentPage != onboardingPages.length - 1) {
                        setState(() {
                          _pageController.nextPage(
                            duration: Durations.medium1,
                            curve: Curves.easeInOutCubicEmphasized,
                          );
                          ++_currentPage;
                        });
                      } else {
                        context.router.replace(const HomeRoute());
                      }
                    },
                    active: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
