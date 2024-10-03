import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/ui/custom_back_button.dart';
import 'package:pp_442/core/ui/custom_icon.dart';
import 'package:pp_442/core/ui/custom_placeholder.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_time/hobby_time.dart';
import 'package:pp_442/features/hobbies/domain/state_management/hobby_time_cubit.dart';
import 'package:pp_442/features/hobbies/presentation/stopwatch/widgets/stopwatch_record_card.dart';
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
                    return StopwatchRecordCard(deleting: _deleting, time: time);
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
