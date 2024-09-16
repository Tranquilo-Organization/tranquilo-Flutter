import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/font_weight_helper.dart';

class TextStyles {
  static TextStyle font24OceanBlueSemiBold = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.oceanBlue,
  );

  static TextStyle font12OceanBlueSemiBold = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.oceanBlue,
  );

  static TextStyle font14JetBlackMedium = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.jetBlack,
  );

  static TextStyle font14lightSilverRegular = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.lightSilver,
  );

  static TextStyle font16JetBlackMedium = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.jetBlack,
  );

  static TextStyle font12LightSilverMedium = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.lightSilver,
  );

  static TextStyle font12JetBlackMedium = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.jetBlack,
  );

  static TextStyle font16WhiteSemiBold = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.white,
  );
}