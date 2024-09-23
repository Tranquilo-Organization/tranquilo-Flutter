import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';

import '../../../../core/routing/routes.dart';

class SurveyCompleted extends StatelessWidget {
  const SurveyCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(40),
            Text(
              'GAD Survey',
              style: TextStyles.font20JetBlackSemiBold,
            ),
            verticalSpace(32),
            Text(
              'You have successfully completed\nthe questionnaire',
              style: TextStyles.font14JetBlackLight,
              textAlign: TextAlign.center,
            ),
            verticalSpace(32),
            SvgPicture.asset(
              'assets/svgs/survey_completed.svg',
              width: 327.w,
              height: 267.h,
              fit: BoxFit.contain,
            ),
            verticalSpace(64),
            AppTextButton(
              textButton: 'View Results',
              onPressed: () {
                context.pushNamed(Routes.surveyResult);
              },
            ),
          ],
        ),
      ),
    );
  }
}

