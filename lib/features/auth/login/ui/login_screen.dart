import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/widgets/or_divider.dart';
import 'package:tranquilo_app/core/widgets/social_media_buttons.dart';
import 'package:tranquilo_app/core/widgets/have_account_question_text.dart';
import 'package:tranquilo_app/features/auth/login/ui/widgets/login_header.dart';
import 'package:tranquilo_app/features/auth/login/logic/login_cubit/login_cubit.dart';
import 'package:tranquilo_app/features/auth/login/logic/login_cubit/login_state.dart';
import 'package:tranquilo_app/features/auth/login/ui/widgets/login_form_with_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            state.map(
              initial: (_) {},
              loading: (_) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      const Center(child: CircularProgressIndicator()),
                );
              },
              success: (_) {
                context.pushNamedAndRemoveUntil(
                  Routes.surveyStarting,
                  predicate: (Route<dynamic> route) => false,
                );
              },
              error: (errorState) {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(16),
                const LoginHeader(),
                verticalSpace(45),
                const LoginFormWithButton(),
                verticalSpace(24),
                const OrDivider(),
                verticalSpace(24),
                const SocialMediaButtons(),
                verticalSpace(24),
                HaveAccountQuestionText(
                  questionText: 'Don’t have an account? ',
                  clickableText: 'Sign Up',
                  onTap: () => context.pushNamed(Routes.signUpScreen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

