import 'package:flutter/material.dart';
import 'package:tranquilo_app/features/profile/ui/widgets/delete_account_dialog.dart';
import 'package:tranquilo_app/features/profile/ui/widgets/settings_list_tile.dart';

class SupportCard extends StatelessWidget {
  const SupportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 10,
      child: Column(
        children: [
          const SettingsListTile(
            icon: 'assets/svgs/about_us_icon.svg',
            title: 'About us',
          ),
          InkWell(
            onTap: (){
              showDeleteDialog(context);
            },
            child: const SettingsListTile(
              icon: 'assets/svgs/delete_account_icon.svg',
              title: 'Delete account',
            ),
          ),
        ],
      ),
    );
  }
}
