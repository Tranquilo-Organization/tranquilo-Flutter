import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/helpers/spacing.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/widgets/or_divider.dart';
import 'package:tranquilo_app/core/widgets/social_media_buttons.dart';
import 'package:tranquilo_app/core/widgets/have_account_question_text.dart';
import 'package:tranquilo_app/features/auth/sign_up/ui/widgets/sign_up_header.dart';
import 'package:tranquilo_app/features/auth/sign_up/ui/widgets/sign_up_form_with_button.dart';
import 'package:tranquilo_app/features/auth/sign_up/logic/sign_up_provider/sign_up_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SignUpProvider>().resetState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<SignUpProvider>(
          builder: (context, provider, child) {
            _handleStateChanges(context, provider);

            return SingleChildScrollView(
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
            );
          },
        ),
      ),
    );
  }

  void _handleStateChanges(BuildContext context, SignUpProvider provider) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (provider.status == SignUpStatus.loading) {
        _showLoadingDialog(context);
      } else if (provider.status == SignUpStatus.success) {
        _handleSuccess(context);
      } else if (provider.status == SignUpStatus.error) {
        _handleError(context, provider.errorMessage);
      }
    });
  }

  void _showLoadingDialog(BuildContext context) {
    if (!_isDialogShowing()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  void _handleSuccess(BuildContext context) {
    if (_isDialogShowing()) {
      Navigator.of(context).pop();
    }

    context.pushNamedAndRemoveUntil(
      Routes.surveyStarting,
      predicate: (Route<dynamic> route) => false,
    );
  }

  void _handleError(BuildContext context, String? errorMessage) {
    if (_isDialogShowing()) {
      Navigator.of(context).pop();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          errorMessage ?? 'An error occurred',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );

    context.read<SignUpProvider>().resetState();
  }

  bool _isDialogShowing() {
    return ModalRoute.of(context)?.isCurrent != true;
  }
}
