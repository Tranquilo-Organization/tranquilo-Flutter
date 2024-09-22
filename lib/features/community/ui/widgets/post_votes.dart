import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/features/community/data/model/post_response.dart';
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
          post: formatNumber(post.upVoteCountLength),
          borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(8.r),
            bottomLeft: Radius.circular(8.r),
          ),
          icon: Icons.arrow_upward,
          iconColor: ColorsManager.green,
          style: TextStyles.font12GreenRegular,
        ),
        VoteIcon(
          post: formatNumber(post.downVoteCountLength),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8.r),
            bottomRight: Radius.circular(8.r),
          ),
          icon: Icons.arrow_downward,
          iconColor: ColorsManager.red,
          style: TextStyles.font12RedRegular,
        ),
      ],
    );
  }
}



