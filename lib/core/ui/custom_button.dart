import 'package:flutter/cupertino.dart';
import 'package:pp_442/config/theme/color_theme_extension.dart';
import 'package:pp_442/config/theme/text_theme_extension.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final bool active;
  final Color? color;
  final Color? disabledColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.active,
    this.color,
    this.disabledColor,
    this.textColor,
  });

  CustomButton.title({
    super.key,
    required String title,
    required this.onPressed,
    required this.active,
    this.color,
    this.disabledColor,
    this.textColor,
  }) : child = Text(
          title,
          style: TextThemeExtension.instance.displaySmall.copyWith(
            color: textColor ?? ColorThemeExtension.instance.primary,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Opacity(
            opacity: active ? 1 : 0.5,
            child: CupertinoButton(
              borderRadius: BorderRadius.circular(30),
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: color ?? context.colors.onPrimary,
              disabledColor: color?.withOpacity(0.5) ??
                  context.colors.onPrimary.withOpacity(.5),
              onPressed: active ? onPressed : null,
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
