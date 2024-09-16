import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/features/auth/login/ui/widgets/already_have_account_text.dart';
import 'package:tranquilo_app/features/auth/login/ui/widgets/login_button.dart';
import 'package:tranquilo_app/features/auth/login/ui/widgets/login_form.dart';
import 'package:tranquilo_app/features/auth/login/ui/widgets/login_header.dart';
import 'package:tranquilo_app/features/auth/login/ui/widgets/or_divider.dart';
import 'package:tranquilo_app/features/auth/login/ui/widgets/social_media_buttons.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(32),
              const LoginHeader(),
              verticalSpace(45),
              const LoginForm(),
              verticalSpace(21),
              const LoginButton(),
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
    );
  }
}