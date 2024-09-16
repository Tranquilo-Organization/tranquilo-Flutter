import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle sign in
          final formState = Form.of(context);
          if (formState.validate() ?? false) {
            formState.save();
            // Perform sign-in logic
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.oceanBlue,
          padding: EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: const Text(
          'Sign in',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
