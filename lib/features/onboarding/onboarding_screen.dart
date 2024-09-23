import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/features/onboarding/model/on_boarding_model.dart';
import 'package:tranquilo_app/features/onboarding/widgets/on_boarding_logo.dart';
import 'package:tranquilo_app/features/onboarding/widgets/on_borading_list.dart';
import 'package:tranquilo_app/features/onboarding/widgets/onboarding_page_view.dart';
import 'package:tranquilo_app/features/onboarding/widgets/on_boarding_indicator.dart';
import 'package:tranquilo_app/features/onboarding/widgets/on_boarding_navigation.dart';
import 'package:tranquilo_app/core/helpers/shared_pref_helper.dart';

import '../../core/helpers/constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  void _onNextPage() {
    if (currentPage < getOnBoardingList().length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      completeOnboarding(context);
    }
  }

  Future<void> completeOnboarding(BuildContext context) async {
    await SharedPrefHelper.setData(SharedPrefKeys.isFirstLaunch, false);
    await SharedPrefHelper.clearAllSecuredData();
    context.pushNamed(Routes.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    List<OnBoardingModel> onboardingList = getOnBoardingList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              verticalSpace(30.h),
              const OnBoardingLogo(),
              verticalSpace(30.h),
              Expanded(
                child: OnBoardingPageView(
                  controller: _controller,
                  onboardingList: onboardingList,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                ),
              ),
              verticalSpace(30.h),
              OnBoardingIndicator(
                controller: _controller,
                length: onboardingList.length,
              ),
              verticalSpace(30.h),
              OnBoardingNavigation(
                controller: _controller,
                currentPage: currentPage,
                length: onboardingList.length,
                onNextPage: _onNextPage,
              ),
              verticalSpace(20.h),
            ],
          ),
        ),
      ),
    );
  }
}
