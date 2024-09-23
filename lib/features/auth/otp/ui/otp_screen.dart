import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/helpers/spacing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/features/auth/otp/ui/widgets/otp_form.dart';
import 'package:tranquilo_app/features/auth/otp/ui/widgets/otp_header.dart';
import 'package:tranquilo_app/features/auth/otp/ui/widgets/resend_otp.dart';
import 'package:tranquilo_app/features/auth/otp/logic/verify_otp_cubit.dart';
import 'package:tranquilo_app/features/auth/otp/logic/verify_otp_state.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
          listener: (context, state) {
            if (state is VerifyOtpSuccess) {
              context.pushNamedAndRemoveUntil(
                Routes.resetPasswordScreen,
                predicate: (Route<dynamic> route) => false,
              );
            } else if (state is VerifyOtpError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: ColorsManager.oceanBlue,
                  content: Text(
                    textAlign: TextAlign.center,
                    state.error.message.toString(),
                    style:
                        TextStyles.font16WhiteSemiBold.copyWith(fontSize: 14),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
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
            );
          },
        ),
      ),
    );
  }
}

