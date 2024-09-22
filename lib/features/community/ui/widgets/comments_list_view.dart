import 'comment_widget.dart';
import 'package:flutter/material.dart';
import 'package:tranquilo_app/features/community/data/models/get_comment_response_model.dart';


class CommentsListView extends StatelessWidget {
  final List<CommentModel> comments;

  const CommentsListView({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final comment = comments[index];
        return CommentWidget(
          profileImage: 'assets/svgs/default_profile.svg',
          name: comment.userName,
          timeAgo: _getTimeAgo(comment.date),
          comment: comment.commentText,
          likes: comment.upVoteCountLength,
        );
      },
    );
  }

  String _getTimeAgo(DateTime commentDate) {
    final now = DateTime.now();
    final difference = now.difference(commentDate).inHours;
    return '$difference min ago';
  }
}
