import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/font_weight_helper.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpace(23),
          SvgPicture.asset('assets/svgs/logout_dialog.svg'),
          verticalSpace(20),
          Text(
            "Oh no! You're leaving...",
            style: TextStyles.font16JetBlackMedium,
            textAlign: TextAlign.center,
          ),
          Text(
            "Are you sure?",
            style: TextStyles.font16JetBlackMedium,
            textAlign: TextAlign.center,
          ),
          verticalSpace(30),
          AppTextButton(
            onPressed: () {
              context.pop();
            },
            textButton: 'Naah, Just kidding',
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            fontWeight: FontWeightHelper.regular,
          ),
          verticalSpace(20),
          AppTextButton(
            onPressed: () {
              SharedPrefHelper.clearAllData();
              SharedPrefHelper.clearAllSecuredData();
              context.pushNamedAndRemoveUntil(
                Routes.loginScreen,
                predicate: (Route<dynamic> route) => false,
              );
            },
            textButton: 'Yes, Log Me Out',
            backgroundColor: Colors.white,
            textColor: ColorsManager.jetBlack,
            borderColor: ColorsManager.oceanBlue,
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            fontWeight: FontWeightHelper.regular,
          ),
          verticalSpace(23),
        ],
      ),
    );
  }
}

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const LogoutConfirmationDialog();
    },
  );
}
