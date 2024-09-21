import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors_manger.dart';
import '../../../../core/theming/styles.dart';

class EditProfileInfo extends StatelessWidget {
  final String infoTitle;

  const EditProfileInfo({
    super.key,
    required this.infoTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            infoTitle,
            textAlign: TextAlign.start,
            style: TextStyles.font16JetBlackRegular.copyWith(
              color: ColorsManager.darkGrey,
            ),
          ),
          TextFormField(
            cursorColor: ColorsManager.oceanBlue,
            decoration: InputDecoration(
              enabledBorder:
                  buildUnderlineInputBorder(ColorsManager.lighterBlack),
              focusedBorder: buildUnderlineInputBorder(ColorsManager.oceanBlue),
            ),
          ),
        ],
      ),
    );
  }

  UnderlineInputBorder buildUnderlineInputBorder(Color color) {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: ColorsManager.lighterBlack,
      ),
    );
  }
}

