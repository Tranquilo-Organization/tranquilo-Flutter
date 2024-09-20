import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/colors_manger.dart';
import '../../../../core/theming/styles.dart';

class CommentsTextField extends StatelessWidget {
  const CommentsTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 7.h),
              margin: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 14.h),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: ColorsManager.containerSilver),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type your comment here...',
                          border: InputBorder.none,
                          hintStyle: TextStyles.font12DarkGreyLight,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/svgs/chatbot_sending_button.svg',
                      height: 32.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
