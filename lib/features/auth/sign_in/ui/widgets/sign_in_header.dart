import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';


class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Sign in",
          style: TextStyle(
            color: ColorsManager.oceanBlue,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpace(24),
        Image.asset(
          'assets/images/logo.png',
          height: 100.h,
        ),
      ],
    );
  }
}
