import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/features/chatbot/ui/widgets/message_input.dart';
import 'package:tranquilo_app/features/chatbot/ui/widgets/chatbot_suggestion.dart';
// ignore_for_file: prefer_const_constructors

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.oceanBlue,
      body: Column(
        children: [
          verticalSpace(120),

          // White Container that fills two-thirds of the screen
          Expanded(
            flex: 2, // Fill two-thirds of the screen
            child: Container(
              margin: EdgeInsets.only(top: 0.h),
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
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ChatBot title and bigger logo
                  Text(
                    'ChatBot',
                    style: TextStyles.font20OceanBlueSemiBold,
                  ),
                  verticalSpace(8),
                  SvgPicture.asset(
                    'assets/svgs/logo_chatbot.svg',
                    height: 64.h,
                  ),
                  verticalSpace(32),

                  // Suggestion Container
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      ChatbotSuggestion(text: "What's on your mind?"),
                      ChatbotSuggestion(text: 'How are you feeling today?'),
                    ],
                  ),

                  const Spacer(),

                  // Message input
                  const MessageInput(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
