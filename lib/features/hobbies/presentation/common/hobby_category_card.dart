import 'package:flutter/cupertino.dart';
import 'package:pp_442/core/extensions/string_extension.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/ui/custom_icon.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_category/hobby_category.dart';
import 'package:pp_442/gen/assets.gen.dart';

class HobbyCategoryCard extends StatelessWidget {
  final HobbyCategory category;
  final HobbyCategory? currentCategory;
  final Function(HobbyCategory category) onSelected;
  const HobbyCategoryCard({
    super.key,
    required this.category,
    required this.currentCategory,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final active = currentCategory == category;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: context.colors.onPrimary,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: active
                          ? context.colors.secondary
                          : context.colors.onSurface,
                    ),
                  ),
                  child: Image.asset(category.assetName),
                ),
                const SizedBox(height: 5),
                FittedBox(
                  child: Text(
                    category.name.capitalize(),
                    style: context.text.bodyMedium.copyWith(
                      color: context.colors.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () => onSelected(category),
          ),
        ),
        if (active)
          Align(
            alignment: Alignment.topCenter,
            child: CustomIcon(
              Assets.icons.checkmarkActive,
              size: 20,
            ),
          ),
      ],
    );
  }
}
