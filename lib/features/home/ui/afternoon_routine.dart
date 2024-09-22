import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';
import 'package:tranquilo_app/features/home/logic/routine_cubit.dart';
import 'package:tranquilo_app/features/home/logic/routine_state.dart';
import 'package:tranquilo_app/features/home/ui/widgets/task_routine.dart';
import 'package:tranquilo_app/features/home/ui/widgets/congrats_dialog.dart';
import 'package:tranquilo_app/features/home/ui/widgets/routine_app_bar.dart';

class AfternoonRoutine extends StatefulWidget {
  const AfternoonRoutine({super.key});

  @override
  State<AfternoonRoutine> createState() => _MorningRoutineState();
}

class _MorningRoutineState extends State<AfternoonRoutine> {
  bool _isFirstTaskChecked = false;
  bool _isSecondTaskChecked = false;
  bool _isThirdTaskChecked = false;

  bool get _areAllTasksChecked =>
      _isFirstTaskChecked && _isSecondTaskChecked && _isThirdTaskChecked;

  @override
  void initState() {
    super.initState();
    // Load routines when the widget is first built
    context.read<RoutineCubit>().fetchRoutines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<RoutineCubit, RoutineState>(
          builder: (context, state) {
            return state.when(
              initial: () =>
                  const Center(child: Text('No routines loaded yet.')),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (routines) {
                // Filter for morning routines
                final dayRoutine = routines.firstWhere(
                  (routine) => routine.type == 'Day',
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
                          // First Task (Step 1)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Row(
                              children: [
                                Checkbox(
                                  activeColor: ColorsManager.oceanBlue,
                                  checkColor: Colors.white,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isFirstTaskChecked = value ?? false;
                                    });
                                  },
                                  value: _isFirstTaskChecked,
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
                            image: 'assets/svgs/first_morning_task.svg',
                          ),
                          verticalSpace(32),

                          // Second Task (Step 2)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Row(
                              children: [
                                Checkbox(
                                  activeColor: ColorsManager.oceanBlue,
                                  checkColor: Colors.white,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isSecondTaskChecked = value ?? false;
                                    });
                                  },
                                  value: _isSecondTaskChecked,
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
                            image: 'assets/svgs/second_morning_task.svg',
                          ),
                          verticalSpace(32),

                          // Third Task (Step 3)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Row(
                              children: [
                                Checkbox(
                                  activeColor: ColorsManager.oceanBlue,
                                  checkColor: Colors.white,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isThirdTaskChecked = value ?? false;
                                    });
                                  },
                                  value: _isThirdTaskChecked,
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
                            image: 'assets/svgs/third_morning_task.svg',
                          ),
                        ],
                      ),
                      verticalSpace(32),
                      AppTextButton(
                        onPressed: _areAllTasksChecked
                            ? () {
                                showCongratsDialog(context);
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
              failure: (error) {
                return Center(
                  child: Text(
                    'Error: ${error.message}',
                    style: TextStyles.font16JetBlackRegular,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
