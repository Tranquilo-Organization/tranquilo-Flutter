import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/features/home/logic/routine_cubit.dart';
import 'package:tranquilo_app/features/home/logic/routine_state.dart';
import 'package:tranquilo_app/features/home/ui/widgets/task_routine.dart';
import 'package:tranquilo_app/features/home/ui/widgets/routine_app_bar.dart';
import 'package:tranquilo_app/features/home/data/model/routine_response_model.dart';

class NightRoutine extends StatelessWidget {
  const NightRoutine({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<RoutineCubit>().fetchRoutines();
    return Scaffold(
      body: BlocBuilder<RoutineCubit, RoutineState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Please wait...')),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (routines) => _buildRoutineContent(routines),
            failure: (error) =>
                Center(child: Text('Failed to load: ${error.message}')),
          );
        },
      ),
    );
  }

  Widget _buildRoutineContent(List<Routine> routines) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const RoutineAppBar(
              titleAppBar: 'Night Routine',
            ),
            verticalSpace(18),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/task_line.svg',
                        height: 550.h,
                      ),
                    ],
                  ),
                ),
                Align(
                  child: Column(
                    children: routines.map((routine) {
                      return Padding(
                        padding: EdgeInsets.only(top: 40.h, left: 30.w),
                        child: TaskRoutine(
                          containerColor: ColorsManager.firstTaskContainer,
                          taskTitle: routine.name,
                          taskDesc: routine.description,
                          image: 'assets/svgs/first_morning_task.svg', // Replace with relevant image
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            verticalSpace(43),
          ],
        ),
      ),
    );
  }
}
