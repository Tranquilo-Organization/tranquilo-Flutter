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
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/features/chatbot/ui/widgets/message_widget.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatbotCubit>(),
      child: Scaffold(
        backgroundColor: ColorsManager.oceanBlue,
        body: SafeArea(
          child: Column(
            children: [
              verticalSpace(40), // Adjust space to your needs
              Text(
                'ChatBot',
                style: TextStyles.font16WhiteSemiBold
                    .copyWith(fontSize: 20.sp), // Use white font
              ),
              verticalSpace(36),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
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
                  child: Column(
                    children: [
                      verticalSpace(46),
                      SvgPicture.asset(
                        'assets/svgs/logo_chatbot.svg',
                        height: 64.h,
                      ),
                      verticalSpace(10),
                      Expanded(
                        child: BlocBuilder<ChatbotCubit, ChatbotState>(
                          builder: (context, state) {
                            bool showSuggestions = state.maybeWhen(
                              initial: (showSuggestions) => showSuggestions,
                              orElse: () => false,
                            );
                            // if (showSuggestions) {
                            //   context.read<ChatbotCubit>().messages.add(
                            //         const Row(
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.spaceEvenly,
                            //           children: [
                            //             ChatbotSuggestion(
                            //                 text: "What's on your mind?"),
                            //             ChatbotSuggestion(
                            //                 text: "How are you feeling today?"),
                            //           ],
                            //         ),
                            //       );
                            // }
                            if (state is Loading) {
                              context.read<ChatbotCubit>().messages.add(
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8.h, horizontal: 16.w),
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        decoration: BoxDecoration(
                                          color: ColorsManager.lighterSilver,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(16.r),
                                            topRight: Radius.circular(16.r),
                                            bottomRight: Radius.circular(16.r),
                                          ),
                                        ),
                                        child: Text(
                                          'Loading...',
                                          style:
                                              TextStyles.font16JetBlackRegular,
                                        ),
                                      ),
                                    ),
                                  );
                            } else if (state is Success) {
                              context
                                  .read<ChatbotCubit>()
                                  .messages
                                  .removeLast();
                              context.read<ChatbotCubit>().messages.add(
                                  MessageWidget(
                                      text: state.request.msg, isSender: true));
                              context.read<ChatbotCubit>().messages.add(
                                  MessageWidget(
                                      text: state.response.response,
                                      isSender: false));
                            } else if (state is Error) {
                              context.read<ChatbotCubit>().messages.add(
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8.h, horizontal: 16.w),
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(16.r),
                                            topRight: Radius.circular(16.r),
                                            bottomRight: Radius.circular(16.r),
                                          ),
                                        ),
                                        child: Text(
                                          'Error: ${getErrorMessage(state.error)}',
                                          style: TextStyles.font16WhiteSemiBold,
                                        ),
                                      ),
                                    ),
                                  );
                            }

                            return Column(
                              children: [
                                showSuggestions
                                    ? const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ChatbotSuggestion(
                                              text: "What's on your mind?"),
                                          ChatbotSuggestion(
                                              text:
                                                  "How are you feeling today?"),
                                        ],
                                      )
                                    : const SizedBox(),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: context
                                        .read<ChatbotCubit>()
                                        .messages
                                        .length,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return context
                                          .read<ChatbotCubit>()
                                          .messages[index];
                                    },
                                  ),
                                ),
                                const MessageInput(),
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
      ),
    );
  }
}
