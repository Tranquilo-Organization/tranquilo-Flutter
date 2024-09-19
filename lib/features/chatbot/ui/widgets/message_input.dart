import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/features/chatbot/logic/chatbot_cubit.dart';
import 'package:tranquilo_app/features/chatbot/data/model/chatbot_request_model.dart';
import 'package:tranquilo_app/features/chatbot/logic/chatbot_state.dart'; // Import ChatbotRequestModel

class MessageInput extends StatefulWidget {
  const MessageInput({super.key});

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatbotCubit, ChatbotState>(
      builder: (context, state) {
        bool isLoading = state is Loading;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
                // Expanded input to avoid overflow
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText:
                            isLoading ? 'Loading...' : 'Type your message...',
                        border: InputBorder.none,
                        hintStyle: TextStyles.font14JetBlackRegular,
                      ),
                      enabled: !isLoading, // Disable input when loading
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    final message = _controller.text;
                    if (message.isNotEmpty && !isLoading) {
                      // Create a ChatbotRequestModel with the user's message
                      final requestModel = ChatbotRequestModel(msg: message);

                      // Call the cubit's getChatbotResponse method
                      context
                          .read<ChatbotCubit>()
                          .getChatbotResponse(requestModel);

                      _controller.clear(); // Clear the input after sending
                    }
                  },
                  child: SvgPicture.asset(
                    'assets/svgs/chatbt_sending_button.svg',
                    height: 32.h,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
