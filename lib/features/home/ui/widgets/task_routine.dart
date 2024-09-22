import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskRoutine extends StatelessWidget {
  final Color containerColor;
  final String taskDesc;
  final String image;

  const TaskRoutine({
    super.key,
    required this.containerColor,
    required this.taskDesc,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          padding: EdgeInsets.only(left: 24.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: containerColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  taskDesc,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font12JetBlackRegular,
                ),
              ),
              Expanded(
                child: SvgPicture.asset(
                  image,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
