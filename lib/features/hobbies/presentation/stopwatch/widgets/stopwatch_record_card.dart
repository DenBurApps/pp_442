import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:pp_442/core/extensions/string_extension.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/helpers/format_helper.dart';
import 'package:pp_442/core/ui/section.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_category/hobby_category.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_time/hobby_time.dart';
import 'package:pp_442/features/hobbies/domain/state_management/hobby_time_cubit.dart';
import 'package:pp_442/features/settings/dialogs/dialog_manager.dart';

class StopwatchRecordCard extends StatelessWidget {
  const StopwatchRecordCard({
    super.key,
    required bool deleting,
    required this.time,
  }) : _deleting = deleting;

  final bool _deleting;
  final HobbyTime time;

  @override
  Widget build(BuildContext context) {
    return Section(
      child: ShakeWidget(
        duration: const Duration(seconds: 4),
        shakeConstant: ShakeDefaultConstant2(),
        autoPlay: _deleting,
        child: CupertinoButton(
          disabledColor: context.colors.primary,
          padding: const EdgeInsets.all(10),
          color: context.colors.primary,
          borderRadius: BorderRadius.circular(20),
          onPressed: _deleting
              ? () async {
                  final cubit = context.read<HobbyTimeCubit>();
                  final result =
                      await DialogManager.deleteConfirmationDialog(context);
                  if (result != null && result) {
                    cubit.delete(time);
                  }
                }
              : null,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: context.colors.onPrimary,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Image.asset(
                  time.category.assetName,
                  width: 60,
                  height: 60,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  time.category.name.capitalize(),
                  style: context.text.displayMedium,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                FormatHelper.formatDuration(time.duration),
                style: context.text.displaySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
