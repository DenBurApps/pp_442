import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_442/config/router/router.dart';
import 'package:pp_442/core/extensions/datetime_extension.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/helpers/format_helper.dart';
import 'package:pp_442/core/ui/custom_icon.dart';
import 'package:pp_442/core/ui/custom_placeholder.dart';
import 'package:pp_442/core/ui/date_timeline.dart';
import 'package:pp_442/core/ui/section.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby/hobby.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_category/hobby_category.dart';
import 'package:pp_442/features/hobbies/domain/entities/weekday/weekday.dart';
import 'package:pp_442/features/hobbies/domain/state_management/hobby_cubit.dart';
import 'package:pp_442/features/hobbies/presentation/hobby_square_card.dart';
import 'package:pp_442/gen/assets.gen.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _focusDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<HobbyCubit, List<Hobby>>(
            builder: (context, hobbies) {
              return CustomScrollView(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Let\'s plan your day',
                                      style: context.text.displaySmall.copyWith(
                                        color: context.colors.onPrimary,
                                      ),
                                    ),
                                    CupertinoButton(
                                      color: context.colors.onPrimary,
                                      borderRadius: BorderRadius.circular(30),
                                      padding: const EdgeInsets.all(10),
                                      onPressed: () => context.router
                                          .push(const StopwatchRoute()),
                                      child: Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.stopwatch,
                                            color: context.colors.primary,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Stopwatch',
                                            style: context.text.labelLarge
                                                .copyWith(
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
                                      Assets.images.appbar.main.path,
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
                    padding: const EdgeInsets.only(top: 20),
                    sliver: SliverToBoxAdapter(
                      child: DateTimeline(
                        focusDate: _focusDate,
                        onSelected: (selectedDate) =>
                            setState(() => _focusDate = selectedDate),
                      ),
                    ),
                  ),
                  if (hobbies.isEmpty)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: CustomPlaceholder(
                        text:
                            'You don\'t have a card.\nLet\'s fix it, add the first note!',
                        assetName: Assets.images.placeholders.main.path,
                      ),
                    ),
                  if (hobbies.isNotEmpty)
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 30),
                      sliver: SliverToBoxAdapter(
                        child: Section(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Your hobbies for the day',
                                style: context.text.bodySmall.copyWith(
                                  color: context.colors.onSurfaceVariant,
                                ),
                              ),
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                minSize: 0,
                                onPressed: () =>
                                    context.router.push(const HistoryRoute()),
                                child: Text(
                                  'See done',
                                  style: context.text.labelLarge.copyWith(
                                    color: context.colors.secondary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (hobbies.isNotEmpty)
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 20),
                      sliver: SliverToBoxAdapter(
                        child: SizedBox(
                          height: 150,
                          child: Builder(
                            builder: (context) {
                              final list = hobbies
                                  .where((hobby) =>
                                      (hobby.date.isSameDate(_focusDate) ||
                                          hobby.date
                                              .isBeforeDate(_focusDate)) &&
                                      (hobby.weekdays != null
                                          ? (hobby.weekdays!.contains(Weekday
                                              .values[_focusDate.weekday - 1]))
                                          : true))
                                  .toList();
                              if (list.isEmpty) {
                                return Center(
                                  child: Text(
                                    'No hobbies planned for the selected day',
                                    style: context.text.bodySmall,
                                  ),
                                );
                              }
                              return ListView.separated(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                scrollDirection: Axis.horizontal,
                                itemCount: list.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 10),
                                itemBuilder: (context, index) {
                                  final hobby = list[index];
                                  return HobbySquareCard(
                                    hobby: hobby,
                                    onPressed: () => context.router.push(
                                      OpenHobbyRoute(
                                        hobby: hobby,
                                        date: _focusDate,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  if (hobbies.isNotEmpty)
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 20),
                      sliver: SliverToBoxAdapter(
                        child: Section(
                          child: Text(
                            'All your created hobbies',
                            style: context.text.bodySmall.copyWith(
                              color: context.colors.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (hobbies.isNotEmpty)
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 20, bottom: 120),
                      sliver: SliverList.separated(
                        itemBuilder: (context, index) {
                          final hobby = hobbies[index];
                          return Section(
                            child: CupertinoButton(
                              padding: const EdgeInsets.all(10),
                              color: context.colors.primary,
                              borderRadius: BorderRadius.circular(20),
                              onPressed: () => context.router
                                  .push(OpenHobbyRoute(hobby: hobby)),
                              child: Row(
                                children: [
                                  Image.asset(
                                    hobby.category.assetName,
                                    width: 60,
                                    height: 60,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      hobby.name,
                                      style: context.text.displayMedium,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Row(
                                    children: [
                                      const Icon(
                                        CupertinoIcons.stopwatch,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        FormatHelper.formatTime(hobby.time),
                                        style: context.text.displayMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: hobbies.length,
                      ),
                    ),
                ],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 120,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      children: [
                        // Background container with a semicircle cut-out
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ClipPath(
                            clipper: SemicircleClipper(),
                            child: Container(
                              height: 75,
                              decoration: BoxDecoration(
                                color: context.colors.primary,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () => context.router
                                            .push(const StatsRoute()),
                                        child: Column(
                                          children: [
                                            CustomIcon(
                                              Assets.icons.stats.path,
                                              color: context.colors.onPrimary,
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              'Statistics',
                                              style: context.text.labelLarge
                                                  .copyWith(
                                                color: context.colors.onPrimary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox.shrink(),
                                      CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () => context.router
                                            .push(const SettingsRoute()),
                                        child: Column(
                                          children: [
                                            CustomIcon(
                                              Assets.icons.settings,
                                              color: context.colors.onPrimary,
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              'Settings',
                                              style: context.text.labelLarge
                                                  .copyWith(
                                                color: context.colors.onPrimary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Plus button in the center
                        Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: CupertinoButton(
                              padding: EdgeInsets.zero,
                              borderRadius: BorderRadius.circular(100),
                              color: context.colors.secondary,
                              onPressed: () =>
                                  context.router.push(NewHobbyRoute()),
                              child: Icon(
                                Icons.add_rounded,
                                size: 40,
                                color: context.colors.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SemicircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const double cutOutRadius = 40; // Adjust as needed

    // Start drawing the rounded rectangle
    path.moveTo(0, 0);
    path.lineTo(0, size.height - 20); // Left side
    path.quadraticBezierTo(
        0, size.height, 20, size.height); // Bottom-left curve
    path.lineTo(size.width / 2 - cutOutRadius, size.height);

    // Draw the semicircle cut-out
    path.arcToPoint(
      Offset(size.width / 2 + cutOutRadius, size.height),
      radius: const Radius.circular(cutOutRadius),
      clockwise: false,
    );

    path.lineTo(size.width - 20, size.height); // Bottom-right curve
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0); // Right side
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
