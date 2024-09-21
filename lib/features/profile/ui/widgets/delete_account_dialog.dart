import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/font_weight_helper.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

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
          verticalSpace(33),
          Text(
            "Deleted account",
            style: TextStyles.font20OceanBlueSemiBold.copyWith(color: ColorsManager.red),
            textAlign: TextAlign.center,
          ),
          verticalSpace(14),
          Text(
            "Are you sure you want to Delete your account?",
            style: TextStyles.font16JetBlackMedium,
            textAlign: TextAlign.center,
          ),
          verticalSpace(23),
          Row(
            children: [
              Expanded(
                child: AppTextButton(
                  onPressed: () {
                    context.pop();
                  },
                  textButton: 'Cancel',
                  fontWeight: FontWeightHelper.regular,
                  borderColor: ColorsManager.black,
                  backgroundColor: ColorsManager.white,
                  textColor: ColorsManager.black,
                ),
              ),
              //horizontalSpace(33),
              Expanded(
                child: AppTextButton(
                  onPressed: () {},
                  textButton: 'Delete',
                  backgroundColor: ColorsManager.red,
                  textColor: ColorsManager.white,
                  borderColor: ColorsManager.red,
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
            ],
          ),
          verticalSpace(25),
        ],
      ),
    );
  }
}

void showDeleteDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const DeleteAccountDialog();
    },
  );
}

