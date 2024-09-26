import 'package:flutter/cupertino.dart';
import 'package:pp_442/core/extensions/string_extension.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/helpers/format_helper.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby/hobby.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_category/hobby_category.dart';

class HobbySquareCard extends StatelessWidget {
  const HobbySquareCard({
    super.key,
    required this.hobby,
    required this.onPressed,
    this.subtitle,
  });

  final Hobby hobby;
  final VoidCallback onPressed;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: 100,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.colors.primary,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: context.colors.primary),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Image.asset(
                          hobby.category.assetName,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Text(
                        FormatHelper.formatTime(hobby.time),
                        style: context.text.displaySmall,
                      ),
                    ],
                  ),
                  Expanded(
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          hobby.category.name.capitalize(),
                          style: context.text.bodySmall,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          if (subtitle != null)
            Text(
              subtitle!,
              style: context.text.bodySmall,
            ),
          const SizedBox(height: 5),
          Text(
            hobby.name,
            style: context.text.bodySmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
