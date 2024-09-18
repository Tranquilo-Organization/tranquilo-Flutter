import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manger.dart';
import '../../../../core/theming/styles.dart';

class ListTileRecommend extends StatelessWidget {
  final String icon;
  final String text;
  const ListTileRecommend({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          ListTile(
            leading: SvgPicture.asset(
              icon,
              fit: BoxFit.contain,
              width: 32.w,
              height: 32.h,
            ),
            title: Text(
              text,
              style: TextStyles.font12JetBlackRegular,
            ),
          ),
          verticalSpace(3),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: const Divider(
              color: ColorsManager.lightSilver,
              thickness: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
