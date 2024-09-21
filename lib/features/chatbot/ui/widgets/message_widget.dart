import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors_manger.dart';
import '../../../../core/theming/styles.dart';

class MessageWidget extends StatelessWidget {
  final String text;
  final bool isSender;

  const MessageWidget({super.key, required this.text, required this.isSender,});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: isSender ? ColorsManager.oceanBlue : ColorsManager.lightGreyBlue,
          borderRadius: isSender?  BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          )
              : BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
            bottomLeft: Radius.circular(16.r),
          ),
        ),
        child: Text(
          text,
          style: isSender ?TextStyles.font16WhiteSemiBold : TextStyles.font16JetBlackRegular,
        ),
      ),
    );
  }
}
