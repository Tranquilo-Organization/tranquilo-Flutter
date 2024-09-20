import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/features/community/data/model/post.dart';
// lib/widgets/post_widget.dart

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
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: ColorsManager.white,
                child: SvgPicture.asset(
                    'assets/svgs/anonymous.svg'), // Updated avatar
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
          Text(post.content, style: TextStyles.font16JetBlackRegular),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: ColorsManager.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: ColorsManager.containerSilver),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svgs/upvote.svg'),
                        SizedBox(width: 4.w),
                        Text(post.upvotes.toString(),
                            style: TextStyles.font14JetBlackRegular),
                        SizedBox(width: 8.w),
                        Container(
                          height: 16.h,
                          width: 1.w,
                          color: Colors.grey.shade400, // Vertical divider line
                        ),
                        SizedBox(width: 8.w),
                        SvgPicture.asset('assets/svgs/downvote.svg'),
                        SizedBox(width: 4.w),
                        Text(post.downvotes.toString(),
                            style: TextStyles.font14JetBlackRegular),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: ColorsManager.containerSilver),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svgs/comment.svg'),
                    SizedBox(width: 4.w),
                    Text('${post.comments} Comments',
                        style: TextStyles.font14JetBlackRegular),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
