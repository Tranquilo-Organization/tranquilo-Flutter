import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tranquilo_app/features/onboarding/model/on_boarding_model.dart';
import 'package:tranquilo_app/features/onboarding/widgets/on_borading_list.dart';
import 'package:tranquilo_app/features/onboarding/widgets/on_boarding_button.dart'; // Ensure correct import path

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  void _onNextPage() {
    if (currentPage < getOnBoardingList().length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      // Navigate to the next screen
    }
  }

  @override
  Widget build(BuildContext context) {
    List<OnBoardingModel> onboardingList = getOnBoardingList();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              // Top logo section
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 30.h,
                  ),
                ),
              ),
              // Onboarding content
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemCount: onboardingList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 200.h,
                            child: SvgPicture.asset(
                              onboardingList[index].imagePath,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Text(
                            onboardingList[index].title,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorsManager.jetBlack,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            onboardingList[index].body,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorsManager.jetBlack,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Smooth page indicator
              Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: onboardingList.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: ColorsManager.oceanBlue,
                    dotHeight: 8.h,
                    dotWidth: 8.w,
                    expansionFactor: 3,
                    spacing: 8.w,
                    dotColor: ColorsManager.oceanBlue,
                  ),
                ),
              ),
              // Bottom button and skip
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        _controller.animateToPage(
                          onboardingList.length - 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
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
                      onPressed: _onNextPage,
                      fillColor: ColorsManager.oceanBlue,
                      textColor: ColorsManager.white,
                      progress: (currentPage + 1) / onboardingList.length,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
