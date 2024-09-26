import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:pp_442/config/router/router.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/ui/section.dart';
import 'package:pp_442/features/settings/dialogs/dialog_manager.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: context.text.displayMedium,
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Section(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    _SettingsTile(
                      title: 'Contact developer',
                      onPressed: () => DialogManager.showContactDialog(context),
                    ),
                    _SettingsTile(
                      title: 'Share feedback',
                      onPressed: () async {
                        final InAppReview inAppReview = InAppReview.instance;
                        if (await inAppReview.isAvailable()) {
                          inAppReview.requestReview();
                        }
                      },
                    ),
                    _SettingsTile(
                      title: 'Privacy Policy',
                      onPressed: () =>
                          context.router.push(const PrivacyPolicyRoute()),
                    ),
                    _SettingsTile(
                      title: 'Terms of Use',
                      onPressed: () =>
                          context.router.push(const TermsOfUseRoute()),
                    ),
                    _SettingsTile(
                      title: 'About the app',
                      onPressed: () =>
                          DialogManager.showAppVersionDialog(context),
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
  const _SettingsTile({
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.only(top: 12, right: 8, bottom: 12, left: 16),
      onPressed: onPressed,
      child: Text(
        title,
        style: context.text.bodyLarge.copyWith(
          color: context.colors.onSurface,
        ),
      ),
    );
  }
}
