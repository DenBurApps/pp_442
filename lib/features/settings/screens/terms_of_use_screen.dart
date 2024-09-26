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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const CustomBackButton(),
        title: Text(
          'Terms of Use',
          style: context.text.displayLarge,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
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
            const SliverToBoxAdapter(child: SizedBox(height: 56)),
          ],
        ),
      ),
    );
  }
}
