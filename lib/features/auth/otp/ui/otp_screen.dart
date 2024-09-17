import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/features/auth/otp/ui/widgets/otp_form.dart';
import 'package:tranquilo_app/features/auth/otp/ui/widgets/otp_header.dart';
import 'package:tranquilo_app/features/auth/otp/ui/widgets/resend_otp.dart';

import '../../../../core/helpers/spacing.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(16),
              const OtpHeader(),
              verticalSpace(64),
              Image.asset(
                'assets/images/logo.png',
                height: 56.h,
              ),
              verticalSpace(64),
              const OtpForm(),
              verticalSpace(20),
              const ResendOtp(),
            ],
          ),
        ),
      ),
    );
  }
}
