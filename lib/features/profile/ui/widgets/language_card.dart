import 'package:flutter/material.dart';
import 'package:tranquilo_app/features/profile/ui/widgets/settings_list_tile.dart';

import '../../../../core/theming/colors_manger.dart';

class LanguageCard extends StatelessWidget {
  const LanguageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.white,
      elevation: 3,
      child: SettingsListTile(
        icon: 'assets/svgs/language_icon.svg',
        title: 'English(US)',
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: ColorsManager.oceanBlue,
          size: 18,
        ),
      ),
    );
  }
}
