import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../theming/colors_manger.dart';

class SocialMediaContainer extends StatelessWidget {
  final String iconImage;
  final void Function()? onPressed;
  const SocialMediaContainer({super.key, required this.iconImage, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96.w,
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
            color: ColorsManager.lightSilver
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          iconImage,
          height: 24.h,
        ),
      ),
    );

  }
}
