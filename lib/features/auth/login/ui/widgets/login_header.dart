import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Sign in",
          style: TextStyles.font24OceanBlueSemiBold.copyWith(color: ColorsManager.jetBlack),
        ),
        verticalSpace(16),
        const Divider(
          color: ColorsManager.lightGreyBlue,
        ),
        verticalSpace(32),
        Image.asset(
          'assets/images/logo.png',
          height: 56.h,
        ),
      ],
    );
  }
}
