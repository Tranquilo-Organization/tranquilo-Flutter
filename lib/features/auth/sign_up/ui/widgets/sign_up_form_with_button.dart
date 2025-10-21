import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/app_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/features/auth/sign_up/ui/widgets/sign_up_form.dart';
import 'package:tranquilo_app/features/auth/sign_up/ui/widgets/terms_and_condition.dart';
import 'package:tranquilo_app/features/auth/sign_up/logic/sign_up_provider/sign_up_provider.dart';

class SignUpFormWithButton extends StatefulWidget {
  const SignUpFormWithButton({super.key});

  @override
  State<SignUpFormWithButton> createState() => _SignUpFormWithButtonState();
}

class _SignUpFormWithButtonState extends State<SignUpFormWithButton> {
  bool _isTermsChecked = false;
  bool _isTermsValid = true;

  void _submitForm() {
    final provider = context.read<SignUpProvider>();

    setState(() {
      _isTermsValid = _isTermsChecked;
    });

    if (provider.formKey.currentState!.validate() && _isTermsChecked) {
      provider.signUp(
        name: provider.nameController.text,
        email: provider.emailController.text,
        password: provider.passwordController.text,
        confirmPassword: provider.confirmPasswordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SignUpProvider>();

    return Column(
      children: [
        SignUpForm(
          formKey: provider.formKey,
          nameController: provider.nameController,
          emailController: provider.emailController,
          passwordController: provider.passwordController,
          confirmPasswordController: provider.confirmPasswordController,
        ),
        verticalSpace(6),
        TermsAndCondition(
          onChanged: (bool isChecked) {
            setState(() {
              _isTermsChecked = isChecked;
              if (isChecked) _isTermsValid = true;
            });
          },
        ),
        if (!_isTermsValid)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'You must agree to the Terms & Conditions',
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
          ),
        verticalSpace(16),
        AppTextButton(
          onPressed: provider.isLoading ? null : _submitForm,
          textButton: 'Sign Up',
        ),
      ],
    );
  }
}
