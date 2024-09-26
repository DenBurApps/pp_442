import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_442/config/router/router.dart';
import 'package:pp_442/core/extensions/string_extension.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/ui/custom_back_button.dart';
import 'package:pp_442/core/ui/custom_icon.dart';
import 'package:pp_442/core/ui/section.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_category/hobby_category.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_time/hobby_time.dart';
import 'package:pp_442/features/hobbies/domain/state_management/hobby_time_cubit.dart';
import 'package:pp_442/features/hobbies/presentation/hobby_bar_chart.dart';
import 'package:pp_442/gen/assets.gen.dart';
import 'package:pull_down_button/pull_down_button.dart';

@RoutePage()
class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  final _scrollController = ScrollController();
  HobbyCategory _category = HobbyCategory.music;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 180,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  color: context.colors.primary,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
                child: SafeArea(
                  child: Section(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomBackButton(
                                  color: context.colors.onPrimary,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Statistics',
                                  style: context.text.displaySmall.copyWith(
                                    color: context.colors.onPrimary,
                                  ),
                                ),
                              ],
                            ),
                            CupertinoButton(
                              color: context.colors.onPrimary,
                              borderRadius: BorderRadius.circular(30),
                              padding: const EdgeInsets.all(10),
                              onPressed: () =>
                                  context.router.push(const StopwatchRoute()),
                              child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.stopwatch,
                                    color: context.colors.primary,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Stopwatch',
                                    style: context.text.labelLarge.copyWith(
                                      color: context.colors.primary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Image.asset(
                              Assets.images.appbar.stats.path,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 30),
            sliver: SliverToBoxAdapter(
              child: PullDownButton(
                scrollController: _scrollController,
                itemBuilder: (context) => HobbyCategory.values
                    .map(
                      (e) => PullDownMenuItem(
                        title: e.name.capitalize(),
                        iconWidget: Image.asset(e.assetName),
                        onTap: () => setState(() => _category = e),
                      ),
                    )
                    .toList(),
                buttonBuilder: (context, showMenu) => Section(
                  child: CupertinoButton(
                    color: context.colors.primary,
                    borderRadius: BorderRadius.circular(20),
                    onPressed: showMenu,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: context.colors.onPrimary,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Image.asset(
                            _category.assetName,
                            width: 60,
                            height: 60,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            _category.name.capitalize(),
                            style: context.text.displayMedium,
                          ),
                        ),
                        CustomIcon(Assets.icons.dropdown),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, bottom: 56),
            sliver: SliverToBoxAdapter(
              child: BlocBuilder<HobbyTimeCubit, List<HobbyTime>>(
                builder: (context, times) {
                  final list =
                      times.where((e) => e.category == _category).toList();
                  final side = MediaQuery.of(context).size.width;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.colors.primary,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: side - 40,
                    height: side - 40,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CupertinoButton(
                              child: CustomIcon(
                                Assets.icons.backward,
                                size: 40,
                              ),
                              onPressed: () => setState(() => _selectedDate =
                                  _selectedDate
                                      .subtract(const Duration(days: 7))),
                            ),
                            CustomIcon(
                              Assets.icons.cup.path,
                              size: 30,
                            ),
                            CupertinoButton(
                              child: CustomIcon(
                                Assets.icons.forward,
                                size: 40,
                              ),
                              onPressed: () => setState(() => _selectedDate =
                                  _selectedDate.add(const Duration(days: 7))),
                            ),
                          ],
                        ),
                        Expanded(
                          child: HobbyBarChart(
                            hobbyTimes: list,
                            selectedDate: _selectedDate,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
