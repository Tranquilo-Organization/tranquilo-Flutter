import 'package:flutter/material.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/theming/colors_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileInfo extends StatelessWidget {
  final String infoTitle;
  final String initialValue;

  const EditProfileInfo({
    super.key,
    required this.infoTitle,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: initialValue);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            infoTitle,
            textAlign: TextAlign.start,
            style: TextStyles.font14JetBlackRegular.copyWith(
              color: ColorsManager.darkGrey,
            ),
          ),
          TextFormField(
            controller: controller,
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
