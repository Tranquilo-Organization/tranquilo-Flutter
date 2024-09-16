import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';
import 'package:tranquilo_app/core/widgets/have_account_question_text.dart';
import 'package:tranquilo_app/core/widgets/or_divider.dart';
import 'package:tranquilo_app/core/widgets/social_media_buttons.dart';
import 'package:tranquilo_app/features/auth/sign_up/ui/widgets/sign_up_form_with_button.dart';
import 'package:tranquilo_app/features/auth/sign_up/ui/widgets/sign_up_header.dart';
import '../../../../core/helpers/spacing.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(16),
              const SignUpHeader(),
              verticalSpace(12),
              const SignUpFormWithButton(),
              verticalSpace(24),
              const OrDivider(),
              verticalSpace(24),
              const SocialMediaButtons(),
              verticalSpace(24),
              HaveAccountQuestionText(
                questionText: 'Already have Account? ',
                clickableText: 'Sign In',
                onTap: () => context.pop()
              ),
            ],
          ),
        ),
      ),
    );
  }
}
