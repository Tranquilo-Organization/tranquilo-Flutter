import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          padding: EdgeInsets.symmetric(
              horizontal: 24.w, vertical: 24.h), // Increased padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(20), // Space added to push content down a bit
              Text(
                'Let’s start GAD survey',
                style: TextStyles.font20JetBlackSemiBold,
              ),
              verticalSpace(3), // Reduced space between text and image
              Expanded(
                child: SvgPicture.asset(
                  'assets/svgs/survey_start.svg',
                  width: 250.w, // Adjusted size of the image
                  fit: BoxFit.contain,
                ),
              ),
              verticalSpace(20),
              Text(
                'This questionnaire will help us understand your anxiety symptoms and provide personalized recommendations for managing them.',
                textAlign: TextAlign.center,
                style: TextStyles.font14JetBlackMedium,
              ),
              verticalSpace(30),
              AppTextButton(
                textButton: 'Start',
                onPressed: () {
                  // Handle the start button press
                },
              ),
              verticalSpace(20),
              Text(
                "By clicking 'Start' you agree to our Terms of Service & Privacy Policy.",
                textAlign: TextAlign.center,
                style: TextStyles.font12LightSilverMedium,
              ),
              verticalSpace(10), // Small space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
