import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/theming/styles.dart';

class HaveAccountQuestionText extends StatelessWidget {
  final String questionText;
  final String clickableText;
  final void Function() onTap;

  const HaveAccountQuestionText({
    super.key,
    required this.questionText,
    required this.clickableText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: questionText,
            style: TextStyles.font12JetBlackMedium,
          ),
          WidgetSpan(
            child: InkWell(
              onTap: onTap,
              child: Text(
                clickableText,
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
