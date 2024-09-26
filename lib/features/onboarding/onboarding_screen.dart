import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pp_442/config/router/router.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/ui/custom_button.dart';
import 'package:pp_442/core/ui/section.dart';
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
            Image.asset(Assets.images.onboarding.a1.path),
            Column(
              children: [
                Text(
                  'Welcome !',
                  style: context.text.displayLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Organize your hobbies and creative projects',
                  style: context.text.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 80),
              ],
            ),
          ],
        ),
      ),
      Section(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(Assets.images.onboarding.a2.path),
            Column(
              children: [
                Text(
                  'HobbyManager is your personal hobby manager',
                  style: context.text.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 80),
              ],
            ),
          ],
        ),
      ),
      Section(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(Assets.images.onboarding.a3.path),
            Column(
              children: [
                Text(
                  'Start managing your hobbies today!',
                  style: context.text.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 80),
              ],
            ),
          ],
        ),
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: onboardingPages,
              ),
            ),
            Section(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CustomButton.title(
                    title: 'Continue',
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
                        context.router.replace(HomeRoute());
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
