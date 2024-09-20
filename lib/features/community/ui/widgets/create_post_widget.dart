import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
// lib/widgets/create_post_widget.dart

class CreatePostWidget extends StatelessWidget {
  const CreatePostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colors.grey.shade400,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: ColorsManager.white,
            child: SvgPicture.asset(
              'assets/svgs/anonymous.svg', // Updated to use 'anonymous.svg'
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpace(12.w),
          Expanded(
            child: Text(
              "What's on your mind?",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
