import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';

class SurveyStarting extends StatelessWidget {
  const SurveyStarting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(40),
              Text(
                'Let’s start GAD survey',
                style: TextStyles.font20JetBlackSemiBold,
              ),
              verticalSpace(32),
              SvgPicture.asset(
                'assets/svgs/survey_start.svg',
                width: 250.w,
                height: 290.h,
                fit: BoxFit.contain,
              ),
              verticalSpace(32),
              Text(
                'This questionnaire will help us\nunderstand your anxiety symptoms and\nprovide personalized recommendations\nfor managing them.',
                textAlign: TextAlign.center,
                style: TextStyles.font14JetBlackMedium,
              ),
              verticalSpace(30),
              AppTextButton(
                textButton: 'Start',
                onPressed: () {
                  context.pushNamed(Routes.surveyScreens);
                },
              ),
              verticalSpace(48),
              Text(
                "By clicking 'Start' you agree to our Terms of\nService & Privacy Policy.",
                textAlign: TextAlign.center,
                style: TextStyles.font12DarkGreyLight,
              ),
              verticalSpace(10),
            ],
          ),
        ),
      ),
    );
  }
}

