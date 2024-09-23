import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/styles.dart';

class NotificationItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String time;
  final bool isCompleted;

  const NotificationItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.time,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SizedBox(
          width: 48,
          height: 48,
          child: ClipOval(
            child: SvgPicture.asset(imageUrl),
          ),
        ),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: name,
                style: TextStyles.font14JetBlackMedium.copyWith(
                  color: ColorsManager.black,
                ),
              ),
              TextSpan(
                text: ' $description',
                style: TextStyles.font14JetBlackRegular.copyWith(
                  color: ColorsManager.black,
                ),
              ),
            ],
          ),
        ),
        trailing: Text(
          time,
          style: TextStyles.font12DarkGreyLight,
        ),
      ),
    );
  }
}
