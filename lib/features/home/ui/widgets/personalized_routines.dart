import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/theming/font_weight_helper.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';
import '../../../../core/theming/colors_manger.dart';
import '../../../../core/theming/styles.dart';

class PersonalizedRoutines extends StatelessWidget {
  final String imagePath;
  final String routineTitle;
  final Color borderColor;
  final double? imageHeight;
  final double? bottomPosition;
  final double? topPosition;
  final double? rightPosition;
  final double? leftPosition;
  final AlignmentGeometry? alignment;

  const PersonalizedRoutines({
    super.key,
    required this.imagePath,
    required this.routineTitle,
    required this.borderColor,
    this.bottomPosition,
    this.topPosition,
    this.rightPosition,
    this.leftPosition,
    this.alignment,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              alignment: alignment ?? AlignmentDirectional.centerEnd,
              height: 124.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: borderColor,
                  width: 1.w,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25.w, top: 10.h),
                    child: Text(
                      routineTitle,
                      style: TextStyles.font16JetBlackMedium.copyWith(
                        color: ColorsManager.black,
                      ),
                    ),
                  ),
                  verticalSpace(16),
                  AppTextButton(
                    onPressed: () {},
                    textButton: 'Start',
                    padding: EdgeInsets.symmetric(vertical: 2.5.h),
                    fontSize: 14,
                    fontWeight: FontWeightHelper.medium,
                    width: 107.w,
                    height: 32.h,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: bottomPosition,
              right: rightPosition,
              left: leftPosition,
              top: topPosition,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SvgPicture.asset(
                  imagePath,
                  height: imageHeight ?? 135.h,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
