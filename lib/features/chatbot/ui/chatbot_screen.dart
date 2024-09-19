import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/network/error_util.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/di/dependency_injection.dart';
import 'package:tranquilo_app/features/chatbot/logic/chatbot_cubit.dart';
import 'package:tranquilo_app/features/chatbot/logic/chatbot_state.dart';
import 'package:tranquilo_app/features/chatbot/ui/widgets/message_input.dart';
import 'package:tranquilo_app/features/chatbot/ui/widgets/chatbot_suggestion.dart';
import 'package:tranquilo_app/features/chatbot/data/model/chatbot_request_model.dart';
import 'package:tranquilo_app/features/chatbot/data/model/chatbot_response_model.dart';
import 'package:tranquilo_app/core/network/api_error_model.dart'; // Import ApiErrorModel
import 'package:tranquilo_app/core/network/api_error_handler.dart'; // Import error handler
import 'package:tranquilo_app/core/theming/styles.dart'; // Updated to reflect new TextStyles

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatbotCubit>(), // Inject the ChatbotCubit
      child: Scaffold(
        backgroundColor: ColorsManager.oceanBlue,
        body: Column(
          children: [
            verticalSpace(120),

            // White Container that fills two-thirds of the screen
            Expanded(
              flex: 2, // Fill two-thirds of the screen
              child: Container(
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChatbotSuggestion(text: "What's on your mind?"),
                        ChatbotSuggestion(text: 'How are you feeling today?'),
                      ],
                    ),

                    Expanded(
                      child: BlocBuilder<ChatbotCubit, ChatbotState>(
                        builder: (context, state) {
                          List<Widget> messages = [];

                          if (state is Loading) {
                            messages.add(
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.h, horizontal: 16.w),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 4.h, horizontal: 8.w),
                                  decoration: BoxDecoration(
                                    color: ColorsManager.lighterSilver,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Text(
                                    'Loading...',
                                    style: TextStyles.font16JetBlackRegular,
                                  ),
                                ),
                              ),
                            );
                          } else if (state is Success) {
                            // Display user message (request) and bot response
                            messages.add(
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.h, horizontal: 16.w),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 4.h, horizontal: 8.w),
                                  decoration: BoxDecoration(
                                    color: ColorsManager.oceanBlue,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Text(
                                    'You: ${state.request.msg}', // Display user message
                                    style: TextStyles.font16WhiteSemiBold,
                                  ),
                                ),
                              ),
                            );

                            messages.add(
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.h, horizontal: 16.w),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 4.h, horizontal: 8.w),
                                  decoration: BoxDecoration(
                                    color: ColorsManager.lightGreyBlue,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Text(
                                    'Bot: ${state.response.response}', // Display bot response
                                    style: TextStyles.font16JetBlackRegular,
                                  ),
                                ),
                              ),
                            );
                          } else if (state is Error) {
                            messages.add(
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.h, horizontal: 16.w),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 4.h, horizontal: 8.w),
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Text(
                                    'Error: ${getErrorMessage(state.error)}', // Use getErrorMessage
                                    style: TextStyles.font16WhiteSemiBold,
                                  ),
                                ),
                              ),
                            );
                          }

                          return Column(
                            children: [
                              // Chatbot conversation box
                              Expanded(
                                child: ListView(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  children: messages,
                                ),
                              ),

                              const MessageInput(), // Message input widget at the bottom
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
