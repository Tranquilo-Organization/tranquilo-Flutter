import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/widgets/app_form_field.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppTextFormField(
          hintText: 'Email',
          prefixIcon: Icon(
            Icons.email_outlined,
            color: ColorsManager.lightSilver,
          ),
        ),
        verticalSpace(16),
        const AppTextFormField(
          hintText: 'Password',
          isObscureText: true,
          prefixIcon: Icon(
            Icons.lock_outline,
            color: ColorsManager.lightSilver,
          ),
          suffixIcon: Icon(
            Icons.visibility_off_outlined,
            color: ColorsManager.lightSilver,
          ),
        ),
        verticalSpace(8),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              // Handle forgot password
            },
            child: const Text(
              "Forgot Password?",
              style: TextStyle(
                color: ColorsManager.oceanBlue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
