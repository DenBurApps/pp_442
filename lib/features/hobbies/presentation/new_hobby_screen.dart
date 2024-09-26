import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/ui/custom_back_button.dart';
import 'package:pp_442/core/ui/custom_button.dart';
import 'package:pp_442/core/ui/custom_icon.dart';
import 'package:pp_442/core/ui/custom_text_field.dart';
import 'package:pp_442/core/ui/date_timeline.dart';
import 'package:pp_442/core/ui/section.dart';
import 'package:pp_442/core/ui/weekday_timeline.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby/hobby.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_category/hobby_category.dart';
import 'package:pp_442/features/hobbies/domain/entities/weekday/weekday.dart';
import 'package:pp_442/features/hobbies/domain/state_management/hobby_cubit.dart';
import 'package:pp_442/features/hobbies/presentation/hobby_category_card.dart';
import 'package:pp_442/features/hobbies/presentation/stage_widget.dart';
import 'package:pp_442/features/onboarding/indicator.dart';
import 'package:pp_442/features/settings/dialogs/dialog_manager.dart';
import 'package:pp_442/gen/assets.gen.dart';
import 'package:uuid/v4.dart';

@RoutePage()
class NewHobbyScreen extends StatefulWidget {
  final Hobby? hobby;
  const NewHobbyScreen({super.key, this.hobby});

  @override
  State<NewHobbyScreen> createState() => _NewHobbyScreenState();
}

class _NewHobbyScreenState extends State<NewHobbyScreen> {
  final _pageController = PageController();
  int _currPage = 0;

  HobbyCategory? _category;
  final _nameController = TextEditingController();
  DateTime _date = DateTime.now();
  DateTime _time = DateTime.now();
  List<Weekday>? _weekdays;
  List<String>? _stages;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(listener);
    final hobby = widget.hobby;
    if (hobby != null) {
      _category = hobby.category;
      _nameController.text = hobby.name;
      _date = hobby.date;
      _time = hobby.time;
      _weekdays = hobby.weekdays;
      _stages = hobby.stages;
    }
  }

  listener() => setState(() => _currPage = _pageController.page!.round());

  @override
  void dispose() {
    _pageController.removeListener(listener);
    _pageController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      Section(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(top: 30),
              sliver: SliverToBoxAdapter(
                child: Text(
                  widget.hobby == null
                      ? 'Select the category\nof your hobby'
                      : 'Select new category\nof your hobby',
                  style: context.text.displayMedium.copyWith(
                    color: context.colors.onPrimary,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 30),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 18,
                  childAspectRatio: 100 / 150,
                ),
                itemCount: HobbyCategory.values.length,
                itemBuilder: (context, index) {
                  final category = HobbyCategory.values[index];
                  return HobbyCategoryCard(
                    category: category,
                    currentCategory: _category,
                    onSelected: (cat) => setState(() => _category = cat),
                  );
                },
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 20, bottom: 56),
              sliver: SliverToBoxAdapter(
                child: Section(
                  child: CustomButton.title(
                    title: 'Next',
                    onPressed: () => _pageController
                        .nextPage(
                          curve: Curves.easeInOutCubicEmphasized,
                          duration: Durations.medium1,
                        )
                        .whenComplete(() => setState(() {})),
                    active: _category != null,
                    color: context.colors.onPrimary,
                    textColor: context.colors.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(top: 30),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Section(
                    child: Column(
                      children: [
                        Text(
                          widget.hobby == null
                              ? 'Set up a hobby'
                              : 'Edit the hobby',
                          style: context.text.displayMedium,
                        ),
                        const SizedBox(height: 30),
                        CustomTextField(
                          controller: _nameController,
                          placeholder: 'Name',
                          onChanged: (_) => setState(() {}),
                          multiline: false,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  DateTimeline(
                    focusDate: _date,
                    onSelected: (newDate) => setState(() => _date = newDate),
                  ),
                  Section(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Divider(color: context.colors.primary),
                        const SizedBox(height: 30),
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: context.colors.primary),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.time,
                            use24hFormat: true,
                            initialDateTime: _time,
                            onDateTimeChanged: (value) =>
                                setState(() => _time = value),
                            selectionOverlayBuilder: (context,
                                {required columnCount,
                                required selectedIndex}) {
                              if (selectedIndex == 0) {
                                return CupertinoPickerDefaultSelectionOverlay(
                                  background:
                                      context.colors.primary.withOpacity(0.3),
                                  capEndEdge: false,
                                );
                              } else if (selectedIndex == columnCount - 1) {
                                return CupertinoPickerDefaultSelectionOverlay(
                                  background:
                                      context.colors.primary.withOpacity(0.3),
                                  capStartEdge: false,
                                );
                              }
                              return CupertinoPickerDefaultSelectionOverlay(
                                background:
                                    context.colors.primary.withOpacity(0.3),
                                capStartEdge: false,
                                capEndEdge: false,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                        Divider(color: context.colors.primary),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Repeating',
                              style: context.text.displaySmall,
                            ),
                            AnimatedToggleSwitch.dual(
                              styleList: [
                                ToggleStyle(
                                  borderColor: Colors.transparent,
                                  backgroundColor: context
                                      .colors.onSurfaceVariant
                                      .withOpacity(0.2),
                                  indicatorColor: context.colors.onPrimary,
                                ),
                                ToggleStyle(
                                  borderColor: Colors.transparent,
                                  backgroundColor: context.colors.secondary,
                                  indicatorColor: context.colors.onPrimary,
                                ),
                              ],
                              indicatorSize: const Size(26, 26),
                              first: true,
                              second: false,
                              current: _weekdays == null,
                              onChanged: (value) => setState(() {
                                if (_weekdays == null) {
                                  _weekdays = [];
                                } else {
                                  _weekdays = null;
                                }
                              }),
                              animationCurve: Curves.easeInOut,
                              animationDuration: Durations.medium1,
                              height: 30,
                              spacing: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (_weekdays != null) const SizedBox(height: 20),
                  if (_weekdays != null)
                    WeekdayTimeline(
                      weekdays: _weekdays!,
                      onPressed: (weekday) => setState(() {
                        if (_weekdays!.contains(weekday)) {
                          _weekdays!.remove(weekday);
                        } else {
                          _weekdays!.add(weekday);
                        }
                      }),
                      areButtons: true,
                    ),
                  Section(
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Stages of work',
                              style: context.text.displaySmall,
                            ),
                            AnimatedToggleSwitch.dual(
                              styleList: [
                                ToggleStyle(
                                  borderColor: Colors.transparent,
                                  backgroundColor: context
                                      .colors.onSurfaceVariant
                                      .withOpacity(0.2),
                                  indicatorColor: context.colors.onPrimary,
                                ),
                                ToggleStyle(
                                  borderColor: Colors.transparent,
                                  backgroundColor: context.colors.secondary,
                                  indicatorColor: context.colors.onPrimary,
                                ),
                              ],
                              indicatorSize: const Size(26, 26),
                              first: true,
                              second: false,
                              current: _stages == null,
                              onChanged: (value) => setState(() {
                                if (_stages == null) {
                                  _stages = ['', '', ''];
                                } else {
                                  _stages = null;
                                }
                              }),
                              animationCurve: Curves.easeInOut,
                              animationDuration: Durations.medium1,
                              height: 30,
                              spacing: 30,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  if (_stages != null)
                    SizedBox(
                      height: 320,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return StageWidget(
                            stageLetter: 'ABC'[index],
                            stage: _stages![index],
                            onChanged: (val) => _stages![index] = val,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                        itemCount: 3,
                      ),
                    ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, bottom: 56),
            sliver: SliverToBoxAdapter(
              child: Section(
                child: CustomButton.title(
                  title: 'Save',
                  onPressed: () {
                    if (widget.hobby == null) {
                      final hobby = Hobby(
                        id: const UuidV4().generate(),
                        category: _category!,
                        name: _nameController.text,
                        date: _date,
                        time: _time,
                        weekdays: _weekdays,
                        stages: _stages,
                      );
                      context.read<HobbyCubit>().create(hobby);
                    } else {
                      final hobby = widget.hobby!.copyWith(
                        category: _category!,
                        name: _nameController.text,
                        date: _date,
                        time: _time,
                        weekdays: _weekdays,
                        stages: _stages,
                      );
                      context.read<HobbyCubit>().update(hobby);
                    }
                    context.router.popForced();
                  },
                  active: _nameController.text.isNotEmpty,
                  color: context.colors.primary,
                  textColor: context.colors.onPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: CustomBackButton(
          color: _currPage == 0
              ? context.colors.onPrimary
              : context.colors.primary,
        ),
        title: Indicator(
          currPage: _currPage,
          totalPages: pages.length,
          color: _currPage == 0
              ? context.colors.onPrimary
              : context.colors.primary,
        ),
        centerTitle: true,
        actions: [
          if (widget.hobby != null)
            CupertinoButton(
              padding: const EdgeInsets.only(right: 20),
              child: CustomIcon(
                Assets.icons.delete,
                size: 40,
              ),
              onPressed: () async {
                final cubit = context.read<HobbyCubit>();
                final router = context.router;
                final result =
                    await DialogManager.deleteConfirmationDialog(context);
                if (result != null && result) {
                  cubit.delete(widget.hobby!);
                  router
                    ..popForced()
                    ..popForced();
                }
              },
            ),
        ],
      ),
      body: AnimatedContainer(
        duration: Durations.medium1,
        color:
            _currPage == 0 ? context.colors.primary : context.colors.onPrimary,
        child: SafeArea(
          bottom: false,
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: pages,
          ),
        ),
      ),
    );
  }
}
