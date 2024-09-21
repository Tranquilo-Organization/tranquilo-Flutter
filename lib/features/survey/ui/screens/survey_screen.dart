import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/styles.dart';

import '../widgets/survey_page_view_builder.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              verticalSpace(40),
              Text(
                'GAD Survey',
                style: TextStyles.font20OceanBlueSemiBold,
                textAlign: TextAlign.center,
              ),
              verticalSpace(32),
              Text(
                'Answer the following questions to\nhelp us understand yor anxiety levels',
                style: TextStyles.font16BlackRegular,
                textAlign: TextAlign.center,
              ),
              verticalSpace(48),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorsManager.containerSilver,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: const SurveyPageViewBuilder(),
              ),
              verticalSpace(80),
            ],
          ),
        ),
      ),
    );
  }
}

