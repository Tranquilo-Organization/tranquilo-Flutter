import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/font_weight_helper.dart';


class TextStyles {
  static TextStyle font24OceanBlueSemiBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.oceanBlue,
  );

  static TextStyle font16JetBlackMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.jetBlack,
  );

  static TextStyle font12LightSilverMedium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.lightSilver,
  );

  static TextStyle font12JetBlackMedium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.jetBlack,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.white,
  );
}
