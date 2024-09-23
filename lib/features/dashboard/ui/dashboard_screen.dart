import 'package:flutter/material.dart';
import '../../../core/theming/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class DashboardScreen extends StatelessWidget{
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                verticalSpace(20),
                Text(
                  'Dashboard',
                  style: TextStyles.font20JetBlackSemiBold,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(32),
                Text(
                  'Anxiety level improvement',
                  style: TextStyles.font14JetBlackMedium,
                ),
                verticalSpace(16),
                SvgPicture.asset('assets/svgs/anxiety_table.svg'),
                verticalSpace(32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Routine completion percentage',
                      style: TextStyles.font14JetBlackMedium,
                    ),
                    Text(
                      '67%',
                      style: TextStyles.font12OceanBlueSemiBold,
                    ),
                  ],
                ),
                verticalSpace(17),
                LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  percent: 0.67,
                  backgroundColor: ColorsManager.containerSilver,
                  progressColor: ColorsManager.oceanBlue,
                  barRadius: Radius.circular(5.r),
                  lineHeight: 7.h,
                ),
                verticalSpace(40),
                Text(
                  'Community Engagement',
                  style: TextStyles.font14JetBlackMedium,
                ),
                verticalSpace(16),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: ColorsManager.containerSilver,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Number of posts =',
                            style: TextStyles.font14JetBlackRegular,
                          ),
                          Text(
                            ' 10',
                            style: TextStyles.font14OceanBlueMedium,
                          ),
                        ],
                      ),
                      verticalSpace(12),
                      Row(
                        children: [
                          Text(
                            'Posts views =',
                            style: TextStyles.font14JetBlackRegular,
                          ),
                          Text(
                            ' 60',
                            style: TextStyles.font14OceanBlueMedium,
                          ),
                        ],
                      ),
                      verticalSpace(12),
                      Row(
                        children: [
                          Text(
                            'Posts comments =',
                            style: TextStyles.font14JetBlackRegular,
                          ),
                          Text(
                            ' 24',
                            style: TextStyles.font14OceanBlueMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}