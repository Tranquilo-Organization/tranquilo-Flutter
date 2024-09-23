import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'comment_widget.dart';

class ReplyWidget extends StatelessWidget {
  final String profileImage;
  final String name;
  final String timeAgo;
  final String comment;

  const ReplyWidget({
    super.key,
    required this.profileImage,
    required this.name,
    required this.timeAgo,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommentWidget(
            profileImage: profileImage,
            name: name,
            timeAgo: timeAgo,
            comment: comment,
            likes: 0,
          ),
        ],
      ),
    );
  }
}
