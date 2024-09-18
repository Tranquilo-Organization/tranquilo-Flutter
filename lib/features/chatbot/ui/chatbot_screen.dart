import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.oceanBlue,
      body: Stack(
        children: [
          // White Container filling most of the screen
          Positioned(
            top: 120.h,
            left: 24.w,
            right: 24.w,
            bottom: 100.h, // leaving space for the floating message bar
            child: Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: ColorsManager.jetBlack.withOpacity(0.1),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'ChatBot',
                    style: TextStyles.font20OceanBlueSemiBold,
                  ),
                  SizedBox(height: 8.h),
                  SvgPicture.asset('assets/svgs/logo_chatbot.svg',
                      height: 32.h),
                  SizedBox(height: 40.h),

                  // Identical Suggestion Containers
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // First Suggestion - Same size as the second
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: ColorsManager.white,
                            borderRadius: BorderRadius.circular(16.r),
                            boxShadow: [
                              BoxShadow(
                                color: ColorsManager.jetBlack.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'What\'s on your mind?',
                              textAlign: TextAlign.center,
                              style: TextStyles.font14JetBlackRegular,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      // Second Suggestion - Same size as the first
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: ColorsManager.white,
                            borderRadius: BorderRadius.circular(16.r),
                            boxShadow: [
                              BoxShadow(
                                color: ColorsManager.jetBlack.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'How are you feeling today?',
                              textAlign: TextAlign.center,
                              style: TextStyles.font14JetBlackRegular,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Floating message bar closer to the bottom of the screen
          Positioned(
            bottom: 24.h, // moved closer to the bottom
            left: 24.w,
            right: 24.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: ColorsManager.black.withOpacity(0.1),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Message Chatbot',
                        border: InputBorder.none,
                        hintStyle: TextStyles.font14JetBlackRegular,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  // Replacing the IconButton with SVG button for sending messages
                  SvgPicture.asset(
                    'assets/svgs/chatbot_button.svg',
                    height: 32.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
