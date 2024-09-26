import 'package:flutter/material.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.currPage,
    required this.totalPages,
    this.color,
  });

  final int currPage;
  final int totalPages;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final active = index == currPage;
          return AnimatedContainer(
            duration: Durations.medium1,
            width: active ? 50 : 10,
            height: 10,
            decoration: BoxDecoration(
              color: active
                  ? (color ?? context.colors.onPrimary)
                  : (color?.withOpacity(.5) ??
                      context.colors.onPrimary.withOpacity(.5)),
              borderRadius: BorderRadius.circular(30),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: totalPages,
      ),
    );
  }
}
