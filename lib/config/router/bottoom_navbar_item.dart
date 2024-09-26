import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/ui/svg_icon.dart';

class BottomNavbarItem extends StatelessWidget {
  final String title;
  final String assetName;
  final int index;
  final int activeIndex;
  const BottomNavbarItem({
    super.key,
    required this.title,
    required this.assetName,
    required this.index,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    final active = index == activeIndex;
    return Expanded(
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          if (active && context.tabsRouter.canPop()) {
            context.tabsRouter.maybePopTop();
          } else {
            context.tabsRouter.setActiveIndex(index);
          }
        },
        child: Column(
          children: [
            SvgIcon(
              assetName,
              side: 25,
              color:
                  active ? context.colors.primary : context.colors.surfaceDim,
            ),
            if (title.isNotEmpty) const SizedBox(height: 6),
            if (title.isNotEmpty)
              Text(
                title,
                style: context.text.bodySmall.copyWith(
                  color: active
                      ? context.colors.primary
                      : context.colors.surfaceDim,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
