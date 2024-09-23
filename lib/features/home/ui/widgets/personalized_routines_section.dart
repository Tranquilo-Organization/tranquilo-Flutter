import 'package:flutter/material.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/helpers/spacing.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import '../../../../../core/theming/colors_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/features/home/ui/widgets/personalized_routines.dart';

class PersonalizedRoutinesSection extends StatelessWidget {
  const PersonalizedRoutinesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personalized Routines',
          textAlign: TextAlign.start,
          style: TextStyles.font16WhiteSemiBold.copyWith(
            color: ColorsManager.black,
          ),
        ),
        verticalSpace(14),
        PersonalizedRoutines(
          imagePath: 'assets/svgs/start_morning_routine.svg',
          routineTitle: 'Morning\nRoutine',
          borderColor: ColorsManager.morningBorder,
          bottomPosition: -4.h,
          onPressed: ()=> context.pushNamed(Routes.morningScreen),
        ),
        verticalSpace(18),
        PersonalizedRoutines(
          imagePath: 'assets/svgs/start_afternoon_routine.svg',
          routineTitle: 'Afternoon\nRoutine',
          borderColor: ColorsManager.afternoonBorder,
          imageHeight: 117.h,
          rightPosition: -33.w,
          bottomPosition: -7.h,
          alignment: AlignmentDirectional.centerStart,
          onPressed: ()=> context.pushNamed(Routes.afternoonScreen),
        ),
        verticalSpace(18),
        PersonalizedRoutines(
          imagePath: 'assets/svgs/start_night_routine.svg',
          routineTitle: 'Night\nRoutine',
          borderColor: ColorsManager.nightBorder,
          topPosition: 5.h,
          leftPosition: -10.w,
          onPressed: ()=> context.pushNamed(Routes.nightScreen),
        ),
        verticalSpace(32),
      ],
    );
  }
}