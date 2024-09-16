import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/styles.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SizedBox(
        width: double.infinity,
        height: 48.h,
        child: ElevatedButton(
          onPressed: () {
            // Handle sign in
            final formState = Form.of(context);
            if (formState.validate() ?? false) {
              formState.save();
              // Perform sign-in logic
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsManager.oceanBlue,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            'Sign in',
            style: TextStyles.font16WhiteSemiBold
          ),
        ),
      ),
    );
  }
}
