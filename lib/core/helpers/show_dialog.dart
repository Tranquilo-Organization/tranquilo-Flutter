import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/font_weight_helper.dart';
import 'package:tranquilo_app/core/theming/styles.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpace(40),
          Image.asset(
            'assets/images/logo.png',
            height: 42.h,
          ),
          verticalSpace(32),
          Text(
            'Password has been reset successfully',
            style: TextStyles.font14JetBlackMedium,
            textAlign: TextAlign.center,
          ),
          verticalSpace(16),
          const Divider(
            color: ColorsManager.lighterSilver,
          ),
          TextButton(
            onPressed: () {
              context.pushNamedAndRemoveUntil(
                Routes.loginScreen,
                predicate: (Route<dynamic> route) => false,
              );
            },
            child: Text(
              'OK',
              style: TextStyles.font20OceanBlueSemiBold
                  .copyWith(fontSize: 16, fontWeight: FontWeightHelper.bold),
            ),
          ),
          verticalSpace(12),
        ],
      ),
    ),
  );
}
