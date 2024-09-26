import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/ui/custom_back_button.dart';
import '../../../core/helpers/text_helper.dart';

@RoutePage()
class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const CustomBackButton(),
        titleSpacing: 0,
        title: Text(
          'Terms of Use',
          style: context.text.displayMedium,
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: context.colors.surface,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Theme(
                  data: ThemeData(brightness: Brightness.light),
                  child: const Markdown(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    data: TextHelper.terms,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 56)),
          ],
        ),
      ),
    );
  }
}
