import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:pp_442/config/router/router.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/ui/custom_back_button.dart';
import 'package:pp_442/core/ui/section.dart';
import 'package:pp_442/features/settings/dialogs/dialog_manager.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const CustomBackButton(),
        title: Text(
          'Settings',
          style: context.text.displayLarge,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Section(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    _SettingsTile(
                      title: 'Version',
                      onPressed: () =>
                          DialogManager.showAppVersionDialog(context),
                      color: context.colors.primary,
                    ),
                    const SizedBox(height: 20),
                    _SettingsTile(
                      title: 'Rate us',
                      onPressed: () async {
                        final InAppReview inAppReview = InAppReview.instance;
                        if (await inAppReview.isAvailable()) {
                          inAppReview.requestReview();
                        }
                      },
                      color: context.colors.primary,
                    ),
                    const SizedBox(height: 20),
                    _SettingsTile(
                      title: 'Terms of Use',
                      onPressed: () => context.router.push(
                        const TermsOfUseRoute(),
                      ),
                      color: context.colors.secondary,
                    ),
                    const SizedBox(height: 20),
                    _SettingsTile(
                      title: 'Contact us',
                      onPressed: () => DialogManager.showContactDialog(context),
                      color: context.colors.secondary,
                    ),
                    const SizedBox(height: 20),
                    _SettingsTile(
                      title: 'Privacy Policy',
                      onPressed: () => context.router.push(
                        const PrivacyPolicyRoute(),
                      ),
                      color: context.colors.secondary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color color;
  const _SettingsTile({
    required this.title,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: color,
      borderRadius: BorderRadius.circular(30),
      padding: const EdgeInsets.symmetric(vertical: 20),
      onPressed: onPressed,
      child: Align(
        child: Text(
          title,
          style: context.text.displaySmall.copyWith(
            color: context.colors.onPrimary,
          ),
        ),
      ),
    );
  }
}
