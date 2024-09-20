import 'package:flutter/material.dart';
import '../../../../core/theming/colors_manger.dart';
import '../../../../core/theming/styles.dart';

class VoteIcon extends StatelessWidget {
  final String post;
  final BorderRadiusGeometry borderRadius;
  final IconData icon;

  const VoteIcon({
    super.key,
    required this.post,
    required this.borderRadius,
    required this.icon,
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
              color: ColorsManager.black,
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
            ),
            Text(
              post,
              style: TextStyles.font12JetBlackRegular,
            ),
          ],
        ),
      ),
    );
  }
}

