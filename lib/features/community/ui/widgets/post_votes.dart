import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/features/community/data/model/post.dart';
import 'package:tranquilo_app/features/community/ui/widgets/vote_icon.dart';

import '../../../../core/helpers/format_number.dart';

class PostVotes extends StatelessWidget {
  final Post post;

  const PostVotes({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VoteIcon(
          post: formatNumber(post.upVotes),
          borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(8.r),
            bottomLeft: Radius.circular(8.r),
          ),
          icon: Icons.arrow_upward,
        ),
        VoteIcon(
          post: formatNumber(post.downVotes),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8.r),
            bottomRight: Radius.circular(8.r),
          ),
          icon: Icons.arrow_downward,
        ),
      ],
    );
  }
}

