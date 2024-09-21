import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/styles.dart';

class ProfileListTile extends StatelessWidget {
  final String icon;
  final String title;
  final Function() onTap;
  const ProfileListTile({super.key, required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: SvgPicture.asset(icon),
        title: Text(
          title,
          style: TextStyles.font16JetBlackRegular,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: ColorsManager.oceanBlue,
          size: 18,
        ),
      ),
    );
  }
}
