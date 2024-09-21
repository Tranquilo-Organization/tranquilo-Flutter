import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/styles.dart';

class SettingsListTile extends StatelessWidget {
  final String? icon;
  final String title;
  final Widget? trailing;

  const SettingsListTile({
    super.key,
    this.icon,
    required this.title,
    this.trailing
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon != null
          ? SvgPicture.asset(icon!)
          : null,
      title: Text(
        title,
        style: TextStyles.font16JetBlackRegular,
      ),
      trailing: trailing,
    );
  }
}

