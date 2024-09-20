import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';

class CommunityPostScreen extends StatefulWidget {
  const CommunityPostScreen({super.key});

  @override
  State<CommunityPostScreen> createState() => _CommunityPostScreenState();
}

class _CommunityPostScreenState extends State<CommunityPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Community',
                  style: TextStyles.font20OceanBlueSemiBold,
                ),
              ),
              verticalSpace(20),
              Container(
                height: 58.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: Colors.grey.shade400, // Grey border color
                    width: 1.0, // Border width
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundColor: ColorsManager.white,
                      child: SvgPicture.asset(
                        'assets/svgs/profile_pic.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    horizontalSpace(12.w),
                    Expanded(
                      child: Text(
                        "What's on your mind?",
                        style: TextStyle(
                          color: Colors.grey.shade600, // Hint color
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
