import 'package:flutter/material.dart';
import '../../../../core/theming/colors_manger.dart';
import '../../../../core/theming/styles.dart';

class VoteIcon extends StatelessWidget {
  final String post;
  final BorderRadiusGeometry borderRadius;
  final IconData icon;
  final Color iconColor;
  final TextStyle? style;

  const VoteIcon({
    super.key,
    required this.post,
    required this.borderRadius,
    required this.icon,
    required this.iconColor, this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: const BorderSide(
              color: ColorsManager.containerSilver,
            ),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: iconColor,
            ),
            Text(
              post,
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}

