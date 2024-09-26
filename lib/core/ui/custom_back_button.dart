import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/ui/custom_icon.dart';
import 'package:pp_442/gen/assets.gen.dart';

class CustomBackButton extends StatelessWidget {
  final Color? color;
  const CustomBackButton({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: CustomIcon(
        Assets.icons.back,
        color: color ?? context.colors.primary,
      ),
      onPressed: () => context.router.popForced(),
    );
  }
}
