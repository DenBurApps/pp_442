import 'package:flutter/cupertino.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';

class CustomPlaceholder extends StatelessWidget {
  final String text;
  final String assetName;
  const CustomPlaceholder({
    super.key,
    required this.text,
    required this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          assetName,
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 15),
        Text(
          text,
          style: context.text.labelLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
