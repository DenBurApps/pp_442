import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:pp_442/core/extensions/string_extension.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/helpers/format_helper.dart';
import 'package:pp_442/core/ui/custom_back_button.dart';
import 'package:pp_442/core/ui/custom_icon.dart';
import 'package:pp_442/core/ui/custom_placeholder.dart';
import 'package:pp_442/core/ui/section.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_category/hobby_category.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_time/hobby_time.dart';
import 'package:pp_442/features/hobbies/domain/state_management/hobby_time_cubit.dart';
import 'package:pp_442/features/settings/dialogs/dialog_manager.dart';
import 'package:pp_442/gen/assets.gen.dart';

@RoutePage()
class StopwatchHistoryScreen extends StatefulWidget {
  const StopwatchHistoryScreen({super.key});

  @override
  State<StopwatchHistoryScreen> createState() => _StopwatchHistoryScreenState();
}

class _StopwatchHistoryScreenState extends State<StopwatchHistoryScreen> {
  bool _deleting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(
          'History',
          style: context.text.displayMedium,
        ),
        actions: [
          if (_deleting)
            CupertinoButton(
              padding: const EdgeInsets.only(right: 20),
              child: CustomIcon(
                Assets.icons.donePrimary,
                size: 40,
              ),
              onPressed: () => setState(() => _deleting = false),
            )
          else
            CupertinoButton(
              padding: const EdgeInsets.only(right: 20),
              child: CustomIcon(
                Assets.icons.deletePrimary,
                size: 40,
              ),
              onPressed: () => setState(() => _deleting = true),
            ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          BlocBuilder<HobbyTimeCubit, List<HobbyTime>>(
            builder: (context, times) {
              if (times.isEmpty) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: CustomPlaceholder(
                    text:
                        'You don\'t have a card.\nLet\'s fix this by adding the value of the first timer!',
                    assetName: Assets.images.placeholders.history.path,
                  ),
                );
              }
              return SliverPadding(
                padding: const EdgeInsets.only(top: 30, bottom: 56),
                sliver: SliverList.separated(
                  itemBuilder: (context, index) {
                    final time = times[index];
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
                                  final result = await DialogManager
                                      .deleteConfirmationDialog(context);
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
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: times.length,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
