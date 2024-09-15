import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/theming/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: TextStyles.font12JetBlackMedium,
          ),
          TextSpan(
            text: ' Sign Up',
            style: TextStyles.font24OceanBlueSemiBold,
          ),
        ],
      ),
    );
  }
}
