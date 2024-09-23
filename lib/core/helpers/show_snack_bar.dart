import 'package:flutter/material.dart';

import '../theming/colors_manger.dart';
import '../theming/styles.dart';

void showSnackBar(BuildContext context, String text, Color? backgroundColor){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: TextStyles.font16WhiteSemiBold.copyWith(
          fontSize: 14,
        ),
      ),
      backgroundColor: backgroundColor ?? ColorsManager.oceanBlue,
    ),
  );
}