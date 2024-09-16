import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/features/auth/forget_password/ui/widgets/forget_password_form.dart';
import 'package:tranquilo_app/features/auth/forget_password/ui/widgets/forget_password_header.dart';
import '../../../../core/helpers/spacing.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(16),
              const ForgetPasswordHeader(),
              verticalSpace(64),
              Image.asset(
                'assets/images/logo.png',
                height: 56.h,
              ),
              verticalSpace(64),
              const ForgetPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
