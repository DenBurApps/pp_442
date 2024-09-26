import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pp_442/core/extensions/string_extension.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/features/hobbies/domain/entities/weekday/weekday.dart';

class WeekdayTimeline extends StatelessWidget {
  final List<Weekday> weekdays;
  final Function(Weekday weekday) onPressed;
  final bool areButtons;
  const WeekdayTimeline({
    super.key,
    required this.weekdays,
    required this.onPressed,
    required this.areButtons,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final weekday = Weekday.values[index];
          final active = weekdays.contains(weekday);
          if (!areButtons) {
            return _WeekdayWidget(active: active, weekday: weekday);
          }
          return CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            onPressed: () => onPressed(weekday),
            child: _WeekdayWidget(active: active, weekday: weekday),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: Weekday.values.length,
      ),
    );
  }
}

class _WeekdayWidget extends StatelessWidget {
  const _WeekdayWidget({
    required this.active,
    required this.weekday,
  });

  final bool active;
  final Weekday weekday;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: active ? context.colors.primary : Colors.transparent,
        border: Border.all(color: context.colors.primary, width: 3),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Text(
          weekday.name.capitalize().substring(0, 3),
          style: context.text.displaySmall.copyWith(
            color: active ? context.colors.onPrimary : context.colors.primary,
          ),
        ),
      ),
    );
  }
}
