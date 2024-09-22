import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/features/community/logic/comments_cubit/comments_cubit.dart';
import 'package:tranquilo_app/features/community/data/models/comment_models/create_comment_request_model.dart';

class CommentsTextField extends StatefulWidget {
  const CommentsTextField({super.key});

  @override
  State<CommentsTextField> createState() => _CommentsTextFieldState();
}

class _CommentsTextFieldState extends State<CommentsTextField> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  Future<void> _submitComment(BuildContext context) async {
    if (_controller.text.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    try {
      String email = await SharedPrefHelper.getEmail();
      String? postIdString = await SharedPrefHelper.getPostId();
      int postId = postIdString != null ? int.parse(postIdString) : 0;

      if (email.isEmpty || postId == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error: Unable to retrieve saved data')),
        );
        return;
      }

      CreateCommentRequestModel requestModel = CreateCommentRequestModel(
        commentText: _controller.text,
        userEmail: email,
        postID: postId,
      );

      context.read<CommentsCubit>().createComment(requestModel);
      _controller.clear();
    } catch (e) {
      debugPrint('Error while submitting comment: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error: Failed to post comment')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type your comment here...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          IconButton(
            icon: SvgPicture.asset('assets/svgs/chatbot_sending_button.svg'),
            onPressed: () => _submitComment(context),
          ),
        ],
      ),
    );
  }
}
