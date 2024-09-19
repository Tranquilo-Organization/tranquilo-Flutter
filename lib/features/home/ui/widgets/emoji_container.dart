import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmojiContainer extends StatelessWidget {
  final String activeEmoji;
  final String inactiveEmoji;
  final Color borderColor;
  final bool isSelected;
  final VoidCallback onTap;

  const EmojiContainer({
    super.key,
    required this.activeEmoji,
    required this.inactiveEmoji,
    required this.borderColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: borderColor,
          ),
          color: isSelected ? borderColor : Colors.transparent,
        ),
        child: SvgPicture.asset(
          isSelected ? activeEmoji : inactiveEmoji,
        ),
      ),
    );
  }
}
