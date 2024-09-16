import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              thickness: 1.5,
              color: ColorsManager.lightSilver,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              "Or",
              style: TextStyles.font14lightSilverRegular,
            ),
          ),
          const Expanded(
            child: Divider(
              thickness: 1.5,
              color: ColorsManager.lightSilver,
            ),
          ),
        ],
      ),
    );
  }
}