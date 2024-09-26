import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_442/config/router/router.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/ui/custom_back_button.dart';
import 'package:pp_442/core/ui/custom_button.dart';
import 'package:pp_442/core/ui/custom_icon.dart';
import 'package:pp_442/core/ui/section.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_category/hobby_category.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_time/hobby_time.dart';
import 'package:pp_442/features/hobbies/domain/state_management/hobby_time_cubit.dart';
import 'package:pp_442/features/hobbies/presentation/custom_tick_indicator.dart';
import 'package:pp_442/features/hobbies/presentation/hobby_category_card.dart';
import 'package:pp_442/gen/assets.gen.dart';
import 'package:uuid/v4.dart';

@RoutePage()
class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  StopwatchScreenState createState() => StopwatchScreenState();
}

class StopwatchScreenState extends State<StopwatchScreen> {
  Timer? _timer;
  int _elapsedSeconds = 0;
  bool _isRunning = false;
  bool _isPaused = false;
  bool _isCompleted = false;

  HobbyCategory? _category;

  void _startTimer() {
    if (!_isRunning) {
      setState(() {
        _isRunning = true;
        _isPaused = false; // Ensure paused is reset
        _isCompleted = false; // Reset completed state
      });

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _elapsedSeconds++;
        });
      });
    }
  }

  void _pauseTimer() {
    if (_isRunning && !_isPaused) {
      _timer?.cancel();
      setState(() {
        _isPaused = true;
      });
    }
  }

  void _resumeTimer() {
    if (_isPaused) {
      setState(() {
        _isPaused = false;
      });

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _elapsedSeconds++;
        });
      });
    }
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _isPaused = false;
      _elapsedSeconds = 0;
      _isCompleted = false; // Reset completed state
    });
  }

  void _finishTimer() {
    if (_isPaused) {
      setState(() {
        _isCompleted = true; // Mark as completed
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int hours = _elapsedSeconds ~/ 3600;
    final int minutes = (_elapsedSeconds % 3600) ~/ 60;
    final int seconds = _elapsedSeconds % 60;

    final double progress = (_elapsedSeconds % 60) / 60;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        leading: CustomBackButton(
          color: context.colors.onPrimary,
        ),
        actions: _isCompleted
            ? []
            : [
                if (_isPaused)
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: _finishTimer,
                    child: CustomIcon(
                      Assets.icons.done,
                      size: 40,
                    ),
                  ),
                const SizedBox(width: 10),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: CustomIcon(
                    Assets.icons.list.path,
                    size: 40,
                  ),
                  onPressed: () => context.router.push(
                    const StopwatchHistoryRoute(),
                  ),
                ),
                const SizedBox(width: 20),
              ],
      ),
      body: AnimatedSwitcher(
        switchInCurve: Curves.easeInOutCubicEmphasized,
        switchOutCurve: Curves.easeIn,
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) => SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(animation),
          child: child,
        ),
        child: _isCompleted
            ? SafeArea(
                bottom: false,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: context.colors.onPrimary,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: CustomIcon(
                                    Assets.icons.back,
                                    color: context.colors.primary,
                                  ),
                                  onPressed: () =>
                                      setState(() => _isCompleted = false),
                                ),
                                Text(
                                  'Save time',
                                  style: context.text.displaySmall,
                                ),
                                Opacity(
                                  opacity: _category == null ? 0.5 : 1,
                                  child: CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: _category == null
                                        ? null
                                        : () {
                                            final hobbyTime = HobbyTime(
                                              id: const UuidV4().generate(),
                                              category: _category!,
                                              date: DateTime.now(),
                                              duration: Duration(
                                                seconds: _elapsedSeconds,
                                              ),
                                            );
                                            context
                                                .read<HobbyTimeCubit>()
                                                .create(hobbyTime);
                                            context.router.popForced();
                                          },
                                    child: CustomIcon(
                                      Assets.icons.donePrimary,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Align(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 11,
                                ),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: context.colors.primary),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                                  style: context.text.displayLarge,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              'What were you doing?',
                              style: context.text.displaySmall,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: context.colors.primary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
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
                                onSelected: (cat) =>
                                    setState(() => _category = cat),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              )
            : Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomTickIndicator(
                              progress: progress,
                              size: 300,
                            ),
                            Text(
                              '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                              style: context.text.displayLarge.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Section(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomButton.title(
                          title: _isRunning && !_isPaused ? 'PAUSE' : 'RESET',
                          onPressed: _isRunning && !_isPaused
                              ? _pauseTimer
                              : _resetTimer,
                          active: _isRunning,
                        ),
                        const SizedBox(height: 10),
                        CustomButton.title(
                          color: context.colors.secondary,
                          textColor: context.colors.onPrimary,
                          title: !_isRunning
                              ? 'START'
                              : (_isPaused ? 'RESUME' : 'START'),
                          onPressed: !_isRunning
                              ? _startTimer
                              : (_isPaused ? _resumeTimer : null),
                          active: !_isRunning || _isPaused,
                        ),
                        const SizedBox(height: 56),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
