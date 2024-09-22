import 'package:flutter/material.dart';
import 'package:tranquilo_app/features/profile/logic/profile_cubit.dart';
import 'package:tranquilo_app/features/profile/ui/widgets/delete_account_dialog.dart';
import 'package:tranquilo_app/features/profile/ui/widgets/settings_list_tile.dart';

class SupportCard extends StatelessWidget {
  final UserProfileCubit userProfileCubit;
  const SupportCard({super.key, required this.userProfileCubit});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Column(
        children: [
          const SettingsListTile(
            icon: 'assets/svgs/about_us_icon.svg',
            title: 'About us',
          ),
          InkWell(
            onTap: () {
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

  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DeleteAccountDialog(
          userProfileCubit: userProfileCubit,
        );
      },
    );
  }
}
