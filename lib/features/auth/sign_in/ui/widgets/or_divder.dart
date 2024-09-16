import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
            color: ColorsManager.lightSilver,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "Or",
            style: TextStyle(
              color: ColorsManager.lightSilver,
              fontSize: 14.sp,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
            color: ColorsManager.lightSilver,
          ),
        ),
      ],
    );
  }
}
