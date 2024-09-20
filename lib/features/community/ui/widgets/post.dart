import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/features/community/data/model/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

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
          // Header Row with Profile Pic and Name
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: ColorsManager.white,
                child: SvgPicture.asset('assets/svgs/profile_pic.svg'),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.author, style: TextStyles.font14JetBlackMedium),
                  Text(post.date, style: TextStyles.font12DarkGreyLight),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          
          // Post Content
          Text(
            post.content,
            style: TextStyles.font16JetBlackRegular,
          ),
          SizedBox(height: 16.h),
          
          // Interaction Row (Upvotes, Downvotes, Comments)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Upvote Button
                  Row(
                    children: [
                      SvgPicture.asset('assets/svgs/upvote.svg'),
                      SizedBox(width: 4.w),
                      Text(post.upvotes.toString(), style: TextStyles.font14JetBlackRegular),
                    ],
                  ),
                  SizedBox(width: 12.w),

                  // Downvote Button
                  Row(
                    children: [
                      SvgPicture.asset('assets/svgs/downvote.svg'),
                      SizedBox(width: 4.w),
                      Text(post.downvotes.toString(), style: TextStyles.font14JetBlackRegular),
                    ],
                  ),
                ],
              ),

              // Comment Button
              Row(
                children: [
                  SvgPicture.asset('assets/svgs/comment.svg'),
                  SizedBox(width: 4.w),
                  Text('${post.comments} Comments', style: TextStyles.font14JetBlackRegular),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
