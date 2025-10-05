import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';
import 'package:tranquilo_app/core/animations/custom_error_widget.dart';
import 'package:tranquilo_app/core/animations/custom_loading_widget.dart';
import 'package:tranquilo_app/features/home/ui/widgets/task_routine.dart';
import 'package:tranquilo_app/features/home/ui/widgets/congrats_dialog.dart';
import 'package:tranquilo_app/features/home/ui/widgets/routine_app_bar.dart';
import 'package:tranquilo_app/features/home/logic/providers/routine_provider.dart';
import 'package:tranquilo_app/features/home/logic/providers/routine_task_provider.dart';

class AfternoonRoutine extends ConsumerWidget {
  const AfternoonRoutine({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routineAsync = ref.watch(routineProvider);
    final taskState = ref.watch(routineTaskProvider('afternoon'));

    return Scaffold(
      body: SafeArea(
        child: routineAsync.when(
          data: (routines) {
            final dayRoutine = routines.firstWhere(
              (routine) => routine.type == 'Day',
              orElse: () => throw Exception('Afternoon routine not found'),
            );
            final steps = dayRoutine.steps;

            return SingleChildScrollView(
              child: Column(
                children: [
                  const RoutineAppBar(
                    titleAppBar: 'Afternoon Routine',
                  ),
                  verticalSpace(18),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: ColorsManager.oceanBlue,
                              checkColor: Colors.white,
                              value: taskState.isFirstTaskChecked,
                              onChanged: (bool? value) {
                                ref
                                    .read(routineTaskProvider('afternoon').notifier)
                                    .toggleFirstTask(value ?? false);
                              },
                            ),
                            Text(
                              'Chunk It Down',
                              style: TextStyles.font16JetBlackRegular,
                            ),
                          ],
                        ),
                      ),
                      TaskRoutine(
                        containerColor: ColorsManager.firstTaskContainer,
                        taskDesc: steps.isNotEmpty
                            ? steps[0]
                            : 'No task description',
                        image: 'assets/svgs/first_afternoon_task.svg',
                      ),
                      verticalSpace(32),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: ColorsManager.oceanBlue,
                              checkColor: Colors.white,
                              value: taskState.isSecondTaskChecked,
                              onChanged: (bool? value) {
                                ref
                                    .read(routineTaskProvider('afternoon').notifier)
                                    .toggleSecondTask(value ?? false);
                              },
                            ),
                            Text(
                              'Breathe & Reset',
                              style: TextStyles.font16JetBlackRegular,
                            ),
                          ],
                        ),
                      ),
                      TaskRoutine(
                        containerColor: ColorsManager.secondTaskContainer,
                        taskDesc: steps.length > 1
                            ? steps[1]
                            : 'No task description',
                        image: 'assets/svgs/second_afternoon_task.svg',
                      ),
                      verticalSpace(32),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: ColorsManager.oceanBlue,
                              checkColor: Colors.white,
                              value: taskState.isThirdTaskChecked,
                              onChanged: (bool? value) {
                                ref
                                    .read(routineTaskProvider('afternoon').notifier)
                                    .toggleThirdTask(value ?? false);
                              },
                            ),
                            Text(
                              'Key Task Focus',
                              style: TextStyles.font16JetBlackRegular,
                            ),
                          ],
                        ),
                      ),
                      TaskRoutine(
                        containerColor: ColorsManager.thirdTaskContainer,
                        taskDesc: steps.length > 2
                            ? steps[2]
                            : 'No task description',
                        image: 'assets/svgs/third_afternoon_task.svg',
                      ),
                    ],
                  ),
                  verticalSpace(32),
                  AppTextButton(
                    onPressed: taskState.areAllTasksChecked
                        ? () {
                            showCongratsDialog(context, 'afternoon');
                          }
                        : null,
                    textButton: 'Finish',
                    backgroundColor: ColorsManager.oceanBlue,
                    disabledBackgroundColor: const Color(0xFFA3C8D3),
                    borderColor: ColorsManager.oceanBlue,
                    disabledTextColor: Colors.white,
                  ),
                  verticalSpace(32),
                ],
              ),
            );
          },
          loading: () => const CustomLoadingWidget(),
          error: (error, stackTrace) {
            return CustomErrorWidget(
              error: 'Error: $error',
            );
          },
        ),
      ),
    );
  }
}