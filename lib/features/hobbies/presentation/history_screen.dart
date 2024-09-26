import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:pp_442/config/router/router.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/helpers/format_helper.dart';
import 'package:pp_442/core/ui/custom_back_button.dart';
import 'package:pp_442/core/ui/custom_icon.dart';
import 'package:pp_442/core/ui/section.dart';
import 'package:pp_442/features/hobbies/domain/entities/completed_hobby/completed_hobby.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby/hobby.dart';
import 'package:pp_442/features/hobbies/domain/state_management/completed_hobby_cubit.dart';
import 'package:pp_442/features/hobbies/domain/state_management/hobby_cubit.dart';
import 'package:pp_442/features/hobbies/presentation/hobby_square_card.dart';
import 'package:pp_442/features/settings/dialogs/dialog_manager.dart';
import 'package:pp_442/gen/assets.gen.dart';

@RoutePage()
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool _deleting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        actions: [
          if (!_deleting)
            CupertinoButton(
              padding: const EdgeInsets.only(right: 20),
              child: CustomIcon(
                Assets.icons.delete,
                size: 40,
              ),
              onPressed: () => setState(() => _deleting = true),
            )
          else
            CupertinoButton(
              padding: const EdgeInsets.only(right: 20),
              child: CustomIcon(
                Assets.icons.done,
                size: 40,
              ),
              onPressed: () => setState(() => _deleting = false),
            ),
        ],
      ),
      body: Section(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Align(
                child: Text('History', style: context.text.displayMedium),
              ),
            ),
            BlocBuilder<HobbyCubit, List<Hobby>>(
              builder: (context, hobbies) {
                return BlocBuilder<CompletedHobbyCubit, List<CompletedHobby>>(
                  builder: (context, completedHobbies) {
                    if (completedHobbies.isEmpty) {
                      return SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text(
                            'It\'s so empty here...',
                            style: context.text.bodySmall,
                          ),
                        ),
                      );
                    }
                    return SliverPadding(
                      padding: const EdgeInsets.only(top: 30, bottom: 56),
                      sliver: SliverGrid.builder(
                        itemCount: completedHobbies.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 25,
                          crossAxisSpacing: 18,
                          childAspectRatio: 100 / 150,
                        ),
                        itemBuilder: (context, index) {
                          final completedHobby =
                              completedHobbies.reversed.toList()[index];
                          final hobby = hobbies.firstWhere(
                              (e) => e.id == completedHobby.hobbyId);
                          if (_deleting) {
                            return ShakeWidget(
                              duration: const Duration(seconds: 4),
                              shakeConstant: ShakeDefaultConstant2(),
                              autoPlay: true,
                              child: HobbySquareCard(
                                hobby: hobby,
                                subtitle: FormatHelper.formatDate(
                                  completedHobby.date,
                                ),
                                onPressed: () async {
                                  final cubit =
                                      context.read<CompletedHobbyCubit>();
                                  final result = await DialogManager
                                      .deleteConfirmationDialog(context);
                                  if (result != null && result) {
                                    cubit.delete(completedHobby);
                                  }
                                },
                              ),
                            );
                          }
                          return HobbySquareCard(
                            hobby: hobby,
                            onPressed: () => context.router.push(
                              OpenHobbyRoute(hobby: hobby),
                            ),
                            subtitle: FormatHelper.formatDate(
                              completedHobby.date,
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
