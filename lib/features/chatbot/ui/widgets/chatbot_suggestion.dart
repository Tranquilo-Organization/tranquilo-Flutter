import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';

import '../../data/model/chatbot_request_model.dart';
import '../../logic/chatbot_cubit.dart';

class ChatbotSuggestion extends StatelessWidget {
  final String text;

  const ChatbotSuggestion({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.read<ChatbotCubit>().getChatbotResponse(
                ChatbotRequestModel(
                  msg: text,
                ),
              );
        },
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
              text,
              textAlign: TextAlign.center,
              style: TextStyles.font14JetBlackRegular,
            ),
          ),
        ),
      ),
    );
  }
}
