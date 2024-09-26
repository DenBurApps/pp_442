import 'package:flutter/cupertino.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';

class NoSomethingPlaceholder extends StatelessWidget {
  final String assetName;
  final String title;
  final String subtitle;
  const NoSomethingPlaceholder({
    super.key,
    required this.assetName,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Image.asset(assetName),
        const SizedBox(height: 32),
        Text(
          title,
          style: context.text.displayMedium,
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: context.text.bodyLarge,
        ),
      ],
    );
  }
}
