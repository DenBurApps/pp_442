import 'package:flutter/cupertino.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/ui/custom_icon.dart';

class SelectionTile extends StatelessWidget {
  const SelectionTile({
    super.key,
    required this.activeIf,
    required this.dataIfActive,
    required this.iconAssetName,
    this.iconColor,
    required this.onPressed,
  });

  final bool activeIf;
  final String dataIfActive;
  final String iconAssetName;
  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              dataIfActive,
              style: context.text.bodyLarge.copyWith(
                color: activeIf
                    ? context.colors.onSurface
                    : context.colors.surfaceDim,
              ),
            ),
          ),
          const SizedBox(width: 8),
          CupertinoButton(
            padding: const EdgeInsets.all(16),
            minSize: 0,
            onPressed: onPressed,
            child: CustomIcon(
              iconAssetName,
              color: iconColor ?? context.colors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
