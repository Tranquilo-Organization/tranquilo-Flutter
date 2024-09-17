import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/widgets/have_account_question_text.dart';
import 'package:tranquilo_app/core/widgets/or_divider.dart';
import 'package:tranquilo_app/core/widgets/social_media_buttons.dart';
import 'package:tranquilo_app/features/auth/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:tranquilo_app/features/auth/sign_up/logic/sign_up_cubit/sign_up_state.dart';
import 'package:tranquilo_app/features/auth/sign_up/ui/widgets/sign_up_form_with_button.dart';
import 'package:tranquilo_app/features/auth/sign_up/ui/widgets/sign_up_header.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<SignUpCubit, SignUpState>(
          listener: (context, state) {
            state.map(
              initial: (_) {},
              signupLoading: (_) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      const Center(child: CircularProgressIndicator()),
                );
              },
              signupSuccess: (_) {
                Navigator.of(context).pop();
                context.pushNamed(Routes.loginScreen);
              },
              signupError: (errorState) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                      errorState.error.message ??
                          'An unexpected error occurred',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            );
          },
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
                    onTap: () => context.pop()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
