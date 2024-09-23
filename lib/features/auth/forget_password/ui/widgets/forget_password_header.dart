import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordHeader extends StatelessWidget {
  const ForgetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 38.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                        color: ColorsManager.lightSilver
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_rounded, color: ColorsManager.jetBlack),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Forget Password",
                  style: TextStyles.font20JetBlackSemiBold,
                ),
              ),
            ],
          ),
        ),
        verticalSpace(12),
        const Divider(
          color: ColorsManager.lightGreyBlue,
        ),
      ],
    );
  }
}
