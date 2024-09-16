import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/features/auth/sign_in/ui/widgets/or_divder.dart';
import 'package:tranquilo_app/features/auth/sign_in/ui/widgets/sign_in_form.dart';
import 'package:tranquilo_app/features/auth/sign_in/ui/widgets/sign_in_button.dart';
import 'package:tranquilo_app/features/auth/sign_in/ui/widgets/sign_in_header.dart';
import 'package:tranquilo_app/features/auth/sign_in/ui/widgets/social_media_buttons.dart';
import 'package:tranquilo_app/features/auth/sign_in/ui/widgets/already_have_account_text.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(48),
                const SignInHeader(),
                verticalSpace(32),
                const SignInForm(),
                verticalSpace(32),
                const SignInButton(),
                verticalSpace(24),
                const OrDivider(),
                verticalSpace(24),
                const SocialMediaButtons(),
                verticalSpace(24),
                const AlreadyHaveAccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
