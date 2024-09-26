import 'package:adoptive_calendar/adoptive_calendar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/helpers/format_helper.dart';
import 'package:pp_442/core/ui/custom_button.dart';
import 'package:pp_442/core/ui/section.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime? initialDate;
  final Function(DateTime date) onDateSelected;
  const CustomDatePicker({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime _date = widget.initialDate ?? DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AdoptiveCalendar(
          datePickerOnly: true,
          backgroundColor: context.scaffoldBackgroundColor,
          initialDate: _date,
          onSelection: (date) => setState(() => _date = date!),
        ),
        const SizedBox(height: 10),
        Section(
          child: Section(
            child: CustomButton.title(
              title: 'Apply ${FormatHelper.formatDate(_date)}',
              onPressed: () {
                widget.onDateSelected(_date);
                context.router.popForced();
              },
              active: true,
            ),
          ),
        ),
      ],
    );
  }
}
