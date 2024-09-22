import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/features/onboarding/widgets/on_boarding_button.dart';

class OnBoardingNavigation extends StatelessWidget {
  final PageController controller;
  final int currentPage;
  final int length;
  final VoidCallback onNextPage;

  const OnBoardingNavigation({
    required this.controller,
    required this.currentPage,
    required this.length,
    required this.onNextPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            context.pushNamed(Routes.loginScreen);
          },
          child: Text(
            'Skip',
            style: TextStyle(
              fontSize: 14.sp,
              color: ColorsManager.oceanBlue,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        FillableButton(
          onPressed: onNextPage,
          fillColor: ColorsManager.oceanBlue,
          textColor: ColorsManager.white,
          progress: (currentPage + 1) / length,
        ),
      ],
    );
  }
}
