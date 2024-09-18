import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/features/survey/ui/widgets/list_tile_recommend.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_button.dart';

class SurveyResult extends StatelessWidget {
  const SurveyResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(40),
              Text(
                'Survey Results',
                style: TextStyles.font20OceanBlueSemiBold,
              ),
              verticalSpace(5),
              SvgPicture.asset(
                'assets/svgs/survey_result.svg',
                width: 327.w,
                height: 327.h,
                fit: BoxFit.contain,
              ),
              verticalSpace(16),
              Text(
                'Your Anxiety level is moderate, here\nare some recommendations :',
                style: TextStyles.font16JetBlackMedium,
              ),
              verticalSpace(12),
              const ListTileRecommend(
                icon: 'assets/svgs/routine.svg',
                text:'Check your personalized routine to manage your anxiety level',
              ),
              const ListTileRecommend(
                icon: 'assets/svgs/community.svg',
                text:'Join our community forum to connect with others',
              ),
              verticalSpace(20),
              AppTextButton(
                textButton: 'Continue to Dashboard',
                onPressed: () {
                  context.pushNamed(Routes.appLayout);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
