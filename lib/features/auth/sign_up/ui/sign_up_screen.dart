import 'package:flutter/material.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/helpers/spacing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/widgets/or_divider.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/widgets/social_media_buttons.dart';
import 'package:tranquilo_app/core/widgets/have_account_question_text.dart';
import 'package:tranquilo_app/features/auth/sign_up/ui/widgets/sign_up_header.dart';
import 'package:tranquilo_app/features/auth/sign_up/data/model/sign_up_response.dart';
import 'package:tranquilo_app/features/auth/sign_up/ui/widgets/sign_up_form_with_button.dart';
import 'package:tranquilo_app/features/auth/sign_up/logic/providers/sign_up_api_provider.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<SignupResponse?>>(
      signUpProvider,
      (previous, next) {
        next.when(
          data: (response) {
            if (response != null) {
              Navigator.of(context).pop();
              context.pushNamedAndRemoveUntil(
                Routes.surveyStarting,
                predicate: (Route<dynamic> route) => false,
              );
            }
          },
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                  child: CircularProgressIndicator(
                color: ColorsManager.oceanBlue,
              )),
            );
          },
          error: (error, stackTrace) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  error.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        );
      },
    );

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
                onTap: () => context.pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
