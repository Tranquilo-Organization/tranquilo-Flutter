import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/features/community/logic/comments_cubit/comments_cubit.dart';
import 'package:tranquilo_app/features/community/data/models/comment_models/create_comment_request_model.dart';

import '../../../../core/theming/colors_manger.dart';
import '../../../../core/theming/styles.dart';

class CommentsTextField extends StatefulWidget {

  const CommentsTextField({super.key});

  @override
  State<CommentsTextField> createState() => _CommentsTextFieldState();
}

class _CommentsTextFieldState extends State<CommentsTextField> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _submitComment(BuildContext context) async {
    if (_controller.text.isEmpty) return;

    try {
      String email = await SharedPrefHelper.getEmail();

      if (email.isEmpty || context.read<CommentsCubit>().post.id == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error: Unable to retrieve saved data')),
        );
        return;
      }

      CreateCommentRequestModel requestModel = CreateCommentRequestModel(
        commentText: _controller.text,
        userEmail: email,
        postID: context.read<CommentsCubit>().post.id,
      );

      context.read<CommentsCubit>().createComment(requestModel);
      _controller.clear();
    } catch (e) {
      debugPrint('Error while submitting comment: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error: Failed to post comment')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 15.h),
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
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText:  'Type your comment here...',
                  border: InputBorder.none,
                  hintStyle: TextStyles.font12JetBlackMedium,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _submitComment(context);
            },
            child: SvgPicture.asset(
              'assets/svgs/chatbot_sending_button.svg',
              height: 32.h,
            ),
          ),
        ],
      ),
    );
  }
}


