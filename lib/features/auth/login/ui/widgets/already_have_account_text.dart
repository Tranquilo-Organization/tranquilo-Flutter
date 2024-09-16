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
            text: 'Don’t have an Account? ',
            style: TextStyles.font12JetBlackMedium,
          ),
          WidgetSpan(
            child: InkWell(
              onTap: () {

              },
              child: Text(
                'Sign Up',
                style: TextStyles.font12OceanBlueSemiBold.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
