import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';
import 'package:tranquilo_app/features/profile/logic/profile_cubit.dart';

import 'delete_account_listener.dart';

class DeleteAccountDialog extends StatelessWidget {
  final UserProfileCubit userProfileCubit;

  const DeleteAccountDialog({super.key, required this.userProfileCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: userProfileCubit,
      child: AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpace(33),
            Text(
              "Delete Account",
              style: TextStyles.font20OceanBlueSemiBold
                  .copyWith(color: ColorsManager.red),
              textAlign: TextAlign.center,
            ),
            verticalSpace(14),
            Text(
              "Are you sure you want to delete your account?",
              style: TextStyles.font16JetBlackMedium,
              textAlign: TextAlign.center,
            ),
            verticalSpace(23),
            Row(
              children: [
                Expanded(
                  child: AppTextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    textButton: 'Cancel',
                    backgroundColor: ColorsManager.white,
                    textColor: ColorsManager.black,
                    borderColor: ColorsManager.black,
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: AppTextButton(
                    onPressed: () {
                      userProfileCubit.deleteUserProfile();
                    },
                    textButton: 'Delete',
                    backgroundColor: ColorsManager.red,
                    textColor: ColorsManager.white,
                    borderColor: ColorsManager.red,
                  ),
                ),
              ],
            ),
            verticalSpace(25),
           const DeleteAccountListener(),
          ],
        ),
      ),
    );
  }
}

