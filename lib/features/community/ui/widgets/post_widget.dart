import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/features/community/data/model/post_response.dart';
import 'package:tranquilo_app/features/community/ui/widgets/post_comments_button.dart';
import 'package:tranquilo_app/features/community/ui/widgets/post_votes.dart';
import '../../../../core/helpers/format_date.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.containerSilver),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: ColorsManager.white,
                child: SvgPicture.asset(
                  'assets/svgs/default_profile.svg',
                  width: 32.w,
                  height: 32.h,
                ),
              ),
              horizontalSpace(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.userName, style: TextStyles.font14JetBlackMedium),
                  Text(formatDate(post.date), style: TextStyles.font12DarkGreyLight),
                ],
              ),
            ],
          ),
          verticalSpace(8),
          Text(post.postText, style: TextStyles.font16JetBlackRegular),
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.5,
                child: PostVotes(post: post),
              ),
              PostCommentsButton(post: post),
            ],
          ),
        ],
      ),
    );
  }
}

