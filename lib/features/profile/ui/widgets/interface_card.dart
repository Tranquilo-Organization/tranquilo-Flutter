import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/features/profile/ui/widgets/settings_list_tile.dart';
import '../../../../core/widgets/switch_widget.dart';

class InterfaceCard extends StatefulWidget {
  const InterfaceCard({super.key});

  @override
  State<InterfaceCard> createState() => _InterfaceCardState();
}

class _InterfaceCardState extends State<InterfaceCard> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Column(
        children: [
          SettingsListTile(
            icon: 'assets/svgs/dark_mode_icon.svg',
            title: 'Dark mode',
            trailing: SwitchWidget(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
          ),
          InkWell(
            onTap: (){
              context.pushNamed(Routes.notificationsSettingsScreen);
            },
            child: const SettingsListTile(
              icon: 'assets/svgs/notifications_home.svg',
              title: 'Notifications',
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: ColorsManager.oceanBlue,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
