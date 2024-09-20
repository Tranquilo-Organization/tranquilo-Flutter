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
          // Post Header
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: ColorsManager.white,
                child: SvgPicture.asset(
                    'assets/svgs/apple.svg', // Ensure path is correct
                    width: 24.w,
                    height: 24.h), // Adjust size of the icon if needed
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
          Text(post.content, style: TextStyles.font16JetBlackRegular),
          SizedBox(height: 16.h),

          // Action Row (Upvote/Downvote and Comments)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Upvote/Downvote Capsule
              _buildCapsuleButton(
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svgs/upvote.svg',
                        width: 16.w, height: 16.h),
                    SizedBox(width: 4.w),
                    Text(post.upvotes.toString(),
                        style: TextStyles.font14JetBlackRegular),
                    Container(
                      height: 20.h,
                      width: 1.w,
                      color: Colors.grey.shade400,
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                    ),
                    SvgPicture.asset('assets/svgs/downvote.svg',
                        width: 16.w, height: 16.h),
                    SizedBox(width: 4.w),
                    Text(post.downvotes.toString(),
                        style: TextStyles.font14JetBlackRegular),
                  ],
                ),
              ),

              // Comment Capsule
              _buildCapsuleButton(
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svgs/comment.svg',
                        width: 16.w, height: 16.h),
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

  // Helper method to build capsule using OutlinedButton
  Widget _buildCapsuleButton({required Widget child}) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        backgroundColor: Colors.grey.shade200, // Light background color
        side: BorderSide(color: Colors.grey.shade300), // Border color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r), // Capsule shape
        ),
      ),
      onPressed: () {},
      child: child,
    );
  }
}
