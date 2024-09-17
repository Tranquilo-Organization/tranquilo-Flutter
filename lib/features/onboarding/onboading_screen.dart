import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tranquilo_app/features/onboarding/model/on_boarding_model.dart';
import 'package:tranquilo_app/features/onboarding/widgets/on_borading_list.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    List<OnBoardingModel> onboardingList = getOnBoardingList();

    return Scaffold(
      body: Column(
        children: [
          // Top logo section
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child:
                SvgPicture.asset('assets/svgs/logo.svg'), // Add your logo here
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
                      onboardingList[index].image,
                      SizedBox(height: 30.h),
                      Text(
                        onboardingList[index].title,
                        style: TextStyles.font24OceanBlueSemiBold,
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        onboardingList[index].body,
                        textAlign: TextAlign.center,
                        style: TextStyles.font14JetBlackRegular,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Smooth page indicator
          SmoothPageIndicator(
            controller: _controller,
            count: onboardingList.length,
            effect: WormEffect(
              activeDotColor: ColorsManager.oceanBlue,
              dotHeight: 10.h,
              dotWidth: 10.w,
              spacing: 15.w,
            ),
          ),
          SizedBox(height: 40.h),

          // Bottom button and skip
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Skip button
                TextButton(
                  onPressed: () {
                    _controller.animateToPage(
                      onboardingList.length - 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyles.font16JetBlackMedium,
                  ),
                ),

                // Next/Proceed button with progress
                GestureDetector(
                  onTap: () async {
                    if (currentPage == onboardingList.length - 1) {
                      // Navigate to the next screen
                    } else {
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(const Duration(
                          seconds: 1)); // Simulate a delay for progress
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: ColorsManager.oceanBlue, width: 2.w),
                    ),
                    child: isLoading
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              strokeWidth: 2.w,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                ColorsManager.oceanBlue,
                              ),
                            ),
                          )
                        : const Icon(
                            Icons.arrow_forward,
                            color: ColorsManager.oceanBlue,
                          ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
