import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/styles.dart';

class CreatePostWidget extends StatelessWidget {
  const CreatePostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.createPostScreen);
      },
      child: Container(
        height: 58.h,
        padding: EdgeInsets.only(left: 8.w, right: 63.w),
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: ColorsManager.containerSilver,
            width: 1.5.w,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: ColorsManager.white,
              child: SvgPicture.asset(
                'assets/svgs/default_profile.svg',
                fit: BoxFit.cover,
              ),
            ),
            horizontalSpace(5.w),
            Text(
              "What's on your mind?",
              style: TextStyles.font14lightGreyRegular,
            ),
          ],
        ),
      ),
    );
  }
}


