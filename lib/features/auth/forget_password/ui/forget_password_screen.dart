import 'package:flutter/material.dart';
import '../../../../core/helpers/spacing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/features/auth/forget_password/ui/widgets/forget_password_form.dart';
import 'package:tranquilo_app/features/auth/forget_password/ui/widgets/forget_password_header.dart';
import 'package:tranquilo_app/features/auth/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';
import 'package:tranquilo_app/features/auth/forget_password/logic/forget_password_cubit/forget_password_state.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {
              showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
            success: (data) {
              Navigator.pop(context);
              context.pushNamed(Routes.otpScreen);
            },
            error: (error) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error.message.toString())),
              );
            },
          );
        },
        child: SafeArea(
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
      ),
    );
  }
}
