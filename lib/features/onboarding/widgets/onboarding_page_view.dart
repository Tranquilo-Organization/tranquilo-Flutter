import 'package:flutter/material.dart';
import 'package:tranquilo_app/features/onboarding/model/on_boarding_model.dart';
import 'package:tranquilo_app/features/onboarding/widgets/onboarding_content.dart';

class OnBoardingPageView extends StatelessWidget {
  final PageController controller;
  final List<OnBoardingModel> onboardingList;
  final Function(int) onPageChanged;

  const OnBoardingPageView({
    super.key,
    required this.controller,
    required this.onboardingList,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      onPageChanged: onPageChanged,
      itemCount: onboardingList.length,
      itemBuilder: (context, index) {
        return OnBoardingContent(onboardingList[index]);
      },
    );
  }
}
