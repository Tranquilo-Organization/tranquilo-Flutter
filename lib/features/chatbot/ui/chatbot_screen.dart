import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/network/error_util.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/di/dependency_injection.dart';
import 'package:tranquilo_app/features/chatbot/logic/chatbot_cubit.dart';
import 'package:tranquilo_app/features/chatbot/logic/chatbot_state.dart';
import 'package:tranquilo_app/core/animations/custom_loading_widget.dart';
import 'package:tranquilo_app/features/chatbot/ui/widgets/message_input.dart';
import 'package:tranquilo_app/features/chatbot/ui/widgets/message_widget.dart';
import 'package:tranquilo_app/features/chatbot/ui/widgets/chatbot_suggestion.dart';
import 'package:tranquilo_app/features/chatbot/data/model/chatbot_request_model.dart';

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
              verticalSpace(40),
              Text(
                'TranqBot',
                style: TextStyles.font16WhiteSemiBold.copyWith(
                  fontSize: 20.sp,
                ),
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
                      verticalSpace(23),
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
                            if (state is Loading) {
                              context.read<ChatbotCubit>().messages.add(
                    const CustomLoadingWidget()
                                  );
                            } else if (state is Success) {
                              context
                                  .read<ChatbotCubit>()
                                  .messages
                                  .removeLast();
                              context.read<ChatbotCubit>().messages.add(
                                    MessageWidget(
                                      text: state.request.msg,
                                      isSender: true,
                                    ),
                                  );
                              context.read<ChatbotCubit>().messages.add(
                                    MessageWidget(
                                      text: state.response.response,
                                      isSender: false,
                                    ),
                                  );
                            } else if (state is Error) {
                              context
                                  .read<ChatbotCubit>()
                                  .messages
                                  .removeLast();
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
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ChatbotSuggestion(
                                            text:
                                                "Can you help me, please?",
                                            onTap: () {
                                              const suggestion =
                                                  "Can you help me, please?";
                                              context
                                                  .read<ChatbotCubit>()
                                                  .getChatbotResponse(
                                                    ChatbotRequestModel(
                                                      msg: suggestion,
                                                    ),
                                                  );
                                            },
                                          ),
                                          ChatbotSuggestion(
                                            text:
                                                "feeling anxious right now",
                                            onTap: () {
                                              const suggestion =
                                                  "feeling anxious right now";
                                              context
                                                  .read<ChatbotCubit>()
                                                  .getChatbotResponse(
                                                    ChatbotRequestModel(
                                                      msg: suggestion,
                                                    ),
                                                  );
                                            },
                                          ),
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
