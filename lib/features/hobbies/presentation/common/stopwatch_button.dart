import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:pp_442/config/router/router.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';

class StopwatchButton extends StatelessWidget {
  const StopwatchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: context.colors.onPrimary,
      borderRadius: BorderRadius.circular(30),
      padding: const EdgeInsets.all(10),
      onPressed: () => context.router.push(const StopwatchRoute()),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.stopwatch,
            color: context.colors.primary,
          ),
          const SizedBox(width: 10),
          Text(
            'Stopwatch',
            style: context.text.labelLarge.copyWith(
              color: context.colors.primary,
            ),
          )
        ],
      ),
    );
  }
}
