import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/features/home/ui/widgets/congrats_dialog.dart';
import 'package:tranquilo_app/features/home/ui/widgets/task_routine.dart';
import 'package:tranquilo_app/features/home/ui/widgets/routine_app_bar.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';

class NightRoutine extends StatefulWidget {
  const NightRoutine({super.key});

  @override
  State<NightRoutine> createState() => _NightRoutineState();
}

class _NightRoutineState extends State<NightRoutine> {
  bool _isFirstTaskChecked = false;
  bool _isSecondTaskChecked = false;
  bool _isThirdTaskChecked = false;

  bool get _areAllTasksChecked =>
      _isFirstTaskChecked && _isSecondTaskChecked && _isThirdTaskChecked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const RoutineAppBar(
                titleAppBar: 'Night Routine',
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
                          onChanged: (bool? value) {
                            setState(() {
                              _isFirstTaskChecked = value ?? false;
                            });
                          },
                          value: _isFirstTaskChecked,
                        ),
                        Text(
                          'Mindfulness Meditation',
                          style: TextStyles.font16JetBlackRegular,
                        )
                      ],
                    ),
                  ),
                  const TaskRoutine(
                    containerColor: ColorsManager.firstTaskContainer,
                    taskDesc:
                    'Start the day with\n15-20 minutes of\ngrounding exercises\nor progressive muscle\nrelaxation to soothe\nintense anxiety',
                    image: 'assets/svgs/first_morning_task.svg',
                  ),
                  verticalSpace(32),
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
                          'Mindfulness Meditation',
                          style: TextStyles.font16JetBlackRegular,
                        )
                      ],
                    ),
                  ),
                  const TaskRoutine(
                    containerColor: ColorsManager.secondTaskContainer,
                    taskDesc:
                    'Focus on gentle, soothing\nactivities in the morning,\nlike taking a slow walk\noutside, practicing yoga,\nor listening to calming\nnature sounds',
                    image: 'assets/svgs/second_morning_task.svg',
                  ),
                  verticalSpace(32),
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
                          'Mindfulness Meditation',
                          style: TextStyles.font16JetBlackRegular,
                        )
                      ],
                    ),
                  ),
                  const TaskRoutine(
                    containerColor: ColorsManager.thirdTaskContainer,
                    taskDesc:
                    'Break down the first\ntask of the day into\nvery small,\nmanageable steps,\nand reward yourself\nafter completing\neach step',
                    image: 'assets/svgs/third_morning_task.svg',
                  ),
                ],
              ),
              verticalSpace(32),
              AppTextButton(
                onPressed: _areAllTasksChecked ? () {
                  showCongratsDialog(context);
                } : null,
                textButton: 'Finish',
                backgroundColor: ColorsManager.oceanBlue,
                disabledBackgroundColor: const Color(0xFFA3C8D3),
                borderColor: ColorsManager.oceanBlue,
                disabledTextColor: Colors.white,
              ),
              verticalSpace(32),

            ],
          ),
        ),
      ),
    );
  }
}
