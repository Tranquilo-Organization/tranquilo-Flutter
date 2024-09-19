import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/font_weight_helper.dart';
import '../theming/colors_manger.dart';
import '../theming/styles.dart';

class AppTextButton extends StatelessWidget {
  final String textButton;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;

  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.textButton,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.width,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SizedBox(
        width: width ?? double.infinity,
        height: height ?? 48.h,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? ColorsManager.oceanBlue,
            padding: padding ??EdgeInsets.symmetric(vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
              side: BorderSide(
                color: borderColor ?? ColorsManager.oceanBlue,
              ),
            ),
          ),
          child: Text(
            textButton,
            style: TextStyles.font16WhiteSemiBold.copyWith(
              color: textColor ?? ColorsManager.white,
              fontSize: fontSize ?? 16,
              fontWeight: fontWeight ?? FontWeightHelper.semiBold,
            ),
          ),
        ),
      ),
    );
  }
}

