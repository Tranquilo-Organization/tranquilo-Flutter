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
      body: Column(
        children: [
          SizedBox(height: 120.h), // Spacing from top

          // White Container that fills two-thirds of the screen
          Expanded(
            flex: 2, // Fill two-thirds of the screen
            child: Container(
              margin: EdgeInsets.only(top: 0.h), // Removed horizontal padding
              decoration: BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorsManager.jetBlack.withOpacity(0.1),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding:
                  EdgeInsets.symmetric(vertical: 24.h), // Only vertical padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ChatBot title and bigger logo
                  Text(
                    'ChatBot',
                    style: TextStyles.font20OceanBlueSemiBold,
                  ),
                  SizedBox(height: 8.h),
                  SvgPicture.asset(
                    'assets/svgs/logo_chatbot.svg',
                    height: 64.h, // Increased size of logo
                  ),
                  SizedBox(height: 32.h),

                  // Identical Suggestion Containers
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
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
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
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

                  Spacer(), // Spacer to push message bar to the bottom

                  // Message input inside the white container with more horizontal padding
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 24
                            .w), // Added padding from the sides (left & right)
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h), // Padding inside the container
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
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8
                                      .w), // Added padding to the message input field
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Message Chatbot',
                                  border: InputBorder.none,
                                  hintStyle: TextStyles.font14JetBlackRegular,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          SvgPicture.asset(
                            'assets/svgs/chatbt_sending_button.svg',
                            height: 32.h,
                          ),
                        ],
                      ),
                    ),
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
