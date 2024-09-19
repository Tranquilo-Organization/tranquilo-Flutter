import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theming/styles.dart';

class TaskRoutine extends StatelessWidget {
  final Color containerColor;
  final String taskTitle;
  final String taskDesc;
  final String image;

  const TaskRoutine({
    super.key,
    required this.containerColor,
    required this.taskTitle,
    required this.taskDesc,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
          height: 188.h,
          width: 282.w,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: containerColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.font14JetBlackSemiBold,
              ),
              Text(
                taskDesc,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.font12JetBlackRegular,
              ),
            ],
          ),
        ),
        Positioned(
          right: -30,
          child: SvgPicture.asset(
            image,
            height: 191.h,
          ),
        ),
      ],
    );
  }
}
