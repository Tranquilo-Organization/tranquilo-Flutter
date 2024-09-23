import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class CommentWidget extends StatelessWidget {
  final String profileImage;
  final String name;
  final String timeAgo;
  final String comment;
  final int likes;

  const CommentWidget({
    super.key,
    required this.profileImage,
    required this.name,
    required this.timeAgo,
    required this.comment,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipOval(
              child: SvgPicture.asset(profileImage),
            ),
            horizontalSpace(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyles.font14JetBlackMedium,
                ),
                Text(
                  timeAgo,
                  style: TextStyles.font12LightSilverMedium,
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 40.w, top: 4.h),
          child: Text(
            comment,
            style: TextStyles.font14JetBlackRegular,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 40.w, top: 8.h),
          child: Row(
            children: [
              Text(
                '$likes Likes',
                style: TextStyles.font12LightSilverMedium,
              ),
              horizontalSpace(16),
              Text(
                'Reply',
                style: TextStyles.font12LightSilverMedium,
              ),
            ],
          ),
        ),
        verticalSpace(16),
      ],
    );
  }
}
