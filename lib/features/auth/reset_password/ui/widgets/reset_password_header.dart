import 'package:flutter/material.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors_manger.dart';
import '../../../../../core/theming/styles.dart';

class ResetPasswordHeader extends StatelessWidget {
  const ResetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Text(
              "Reset Password",
              style: TextStyles.font20JetBlackSemiBold,
            ),
          ],
        ),
        verticalSpace(12),
        const Divider(
          color: ColorsManager.lightGreyBlue,
        ),
      ],
    );
  }
}
