import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/theming/font_weight_helper.dart';

import '../../../../../core/theming/styles.dart';

class ResendOtp extends StatelessWidget {
  const ResendOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Didn't receive the code? ",
        style: TextStyles.font14JetBlackMedium,
        children: [
          TextSpan(
            text: 'Resend',
            style: TextStyles.font14OceanBlueMedium.copyWith(fontWeight: FontWeightHelper.semiBold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
               //  resend logic
              },
          ),
        ],
      ),
    );
  }
}

