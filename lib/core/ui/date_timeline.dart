import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:pp_442/core/extensions/datetime_extension.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/helpers/format_helper.dart';

class DateTimeline extends StatefulWidget {
  final DateTime focusDate;
  final Function(DateTime newDate) onSelected;
  const DateTimeline(
      {super.key, required this.focusDate, required this.onSelected});

  @override
  State<DateTimeline> createState() => _DateTimelineState();
}

class _DateTimelineState extends State<DateTimeline> {
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();

  @override
  Widget build(BuildContext context) {
    return EasyInfiniteDateTimeLine(
      controller: _controller,
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 1000)),
      focusDate: widget.focusDate,
      lastDate: DateTime.now().add(const Duration(days: 365 * 1000)),
      onDateChange: widget.onSelected,
      showTimelineHeader: false,
      dayProps: const EasyDayProps(
        height: 90,
        width: 50,
      ),
      itemBuilder: (context, date, isSelected, onTap) => CupertinoButton(
        color: isSelected ? context.colors.secondary : context.colors.primary,
        borderRadius: BorderRadius.circular(31),
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              width: 3,
              color: date.isSameDate(DateTime.now()) || isSelected
                  ? context.colors.secondary
                  : context.colors.primary,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                FormatHelper.formatDateWeekday(date)[0],
                style: context.text.bodySmall.copyWith(
                  color: context.colors.onPrimary.withOpacity(0.5),
                ),
              ),
              Text(
                date.day.toString(),
                style: context.text.bodyMedium.copyWith(
                  color: context.colors.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
