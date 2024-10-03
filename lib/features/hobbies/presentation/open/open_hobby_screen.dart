import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_442/config/router/router.dart';
import 'package:pp_442/core/extensions/datetime_extension.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/helpers/format_helper.dart';
import 'package:pp_442/core/ui/custom_back_button.dart';
import 'package:pp_442/core/ui/custom_icon.dart';
import 'package:pp_442/core/ui/section.dart';
import 'package:pp_442/core/ui/weekday_timeline.dart';
import 'package:pp_442/features/hobbies/domain/entities/completed_hobby/completed_hobby.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby/hobby.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_category/hobby_category.dart';
import 'package:pp_442/features/hobbies/domain/state_management/completed_hobby_cubit.dart';
import 'package:pp_442/features/hobbies/domain/state_management/hobby_cubit.dart';
import 'package:pp_442/features/hobbies/presentation/common/stage_widget.dart';
import 'package:pp_442/gen/assets.gen.dart';
import 'package:uuid/v4.dart';

@RoutePage()
class OpenHobbyScreen extends StatefulWidget {
  final Hobby hobby;
  final DateTime? date;
  const OpenHobbyScreen({super.key, required this.hobby, this.date});

  @override
  State<OpenHobbyScreen> createState() => _OpenHobbyScreenState();
}

class _OpenHobbyScreenState extends State<OpenHobbyScreen> {
  late Hobby _hobby = widget.hobby;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        actions: [
          CupertinoButton(
            padding: const EdgeInsets.only(right: 20),
            child: CustomIcon(
              Assets.icons.edit,
              size: 40,
            ),
            onPressed: () async {
              final newHobby = await context.router
                  .push(NewHobbyRoute(hobby: _hobby)) as Hobby?;
              if (newHobby != null) {
                setState(() {
                  _hobby = newHobby;
                });
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<CompletedHobbyCubit, List<CompletedHobby>>(
        builder: (context, state) {
          final hobbyDone = widget.date != null &&
              state.firstWhereOrNull((e) =>
                      e.hobbyId == widget.hobby.id &&
                      e.date.isSameDate(widget.date!)) !=
                  null;
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Section(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Hobby',
                                    style: context.text.displayLarge,
                                  ),
                                  const SizedBox(width: 10),
                                  if (hobbyDone)
                                    CustomIcon(Assets.icons.checkmark)
                                  else
                                    const SizedBox.shrink(),
                                ],
                              ),
                              if (widget.date != null)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: context.colors.primary,
                                    borderRadius: BorderRadius.circular(48),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        FormatHelper.formatDateWeekday(
                                                widget.date!)
                                            .substring(0, 3),
                                        style:
                                            context.text.displaySmall.copyWith(
                                          color: context.colors.onPrimary,
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        widget.date!.day.toString(),
                                        style: context.text.bodyMedium.copyWith(
                                          color: context.colors.onPrimary,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Builder(
                            builder: (context) {
                              final side =
                                  MediaQuery.of(context).size.width - 80;
                              return Image.asset(
                                _hobby.category.assetName,
                                width: side,
                                height: side,
                              );
                            },
                          ),
                          const SizedBox(height: 30),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 50,
                            ),
                            decoration: BoxDecoration(
                              color: context.colors.secondary,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Text(
                              FormatHelper.formatTime(_hobby.time),
                              style: context.text.displayLarge.copyWith(
                                color: context.colors.onPrimary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(color: context.colors.primary),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                _hobby.name,
                                style: context.text.displaySmall,
                              ),
                            ),
                          ),
                          if (_hobby.weekdays != null)
                            const SizedBox(height: 30),
                          if (_hobby.weekdays != null)
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                'Repeating',
                                style: context.text.displaySmall,
                              ),
                            ),
                          if (_hobby.weekdays != null)
                            const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    if (_hobby.weekdays != null)
                      WeekdayTimeline(
                        weekdays: _hobby.weekdays!,
                        onPressed: (_) {},
                        areButtons: false,
                      ),
                    if (widget.date != null && !hobbyDone)
                      const SizedBox(height: 30),
                    if (widget.date != null && !hobbyDone)
                      Section(
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(30),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          color: context.colors.secondary,
                          onPressed: () {
                            final completedHobby = CompletedHobby(
                              id: const UuidV4().generate(),
                              hobbyId: widget.hobby.id,
                              date: widget.date!,
                            );
                            context
                                .read<CompletedHobbyCubit>()
                                .create(completedHobby);
                          },
                          child: Align(
                            child: Text(
                              'Completed',
                              style: context.text.bodyLarge.copyWith(
                                color: context.colors.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (_hobby.stages != null) const SizedBox(height: 30),
                    if (_hobby.stages != null)
                      SizedBox(
                        height: 320,
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return StageWidget(
                              stageLetter: 'ABC'[index],
                              stage: _hobby.stages![index],
                              onChanged: (val) {
                                final newStages = _hobby.stages!.toList();
                                newStages[index] = val;
                                final newHobby =
                                    _hobby.copyWith(stages: newStages);
                                context.read<HobbyCubit>().update(newHobby);
                              },
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 10),
                          itemCount: 3,
                        ),
                      ),
                    const SizedBox(height: 56),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
