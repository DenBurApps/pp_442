import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:pp_442/core/ui/svg_icon.dart';
import 'package:pp_442/gen/assets.gen.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: SvgIcon(Assets.icons.back),
      onPressed: () => context.router.popForced(),
    );
  }
}
