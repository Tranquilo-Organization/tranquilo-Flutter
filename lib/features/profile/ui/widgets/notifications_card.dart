import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/features/profile/ui/widgets/settings_list_tile.dart';
import '../../../../core/widgets/switch_widget.dart';

class NotificationsCard extends StatefulWidget {
  const NotificationsCard({super.key});

  @override
  State<NotificationsCard> createState() => _NotificationsCardState();
}

class _NotificationsCardState extends State<NotificationsCard> {
  bool showNotifications = false;
  bool availableSound = false;
  bool reactNotifications = false;
  bool showPreview = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.white,
          elevation: 3,
          child: Column(
            children: [
              SettingsListTile(
                title: 'Show notification',
                trailing: SwitchWidget(
                  value: showNotifications,
                  onChanged: (value) {
                    setState(() {
                      showNotifications = value;
                    });
                  },
                ),
              ),
              SettingsListTile(
                title: 'Sound',
                trailing: SwitchWidget(
                  value: availableSound,
                  onChanged: (value) {
                    setState(() {
                      availableSound = value;
                    });
                  },
                ),
              ),
              SettingsListTile(
                title: 'Reaction notification',
                trailing: SwitchWidget(
                  value: reactNotifications,
                  onChanged: (value) {
                    setState(() {
                      reactNotifications = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        verticalSpace(12),
        Card(
          color: Colors.white,
          elevation: 3,
          child: SettingsListTile(
            title: 'Show preview',
            trailing: SwitchWidget(
              value: showPreview,
              onChanged: (value) {
                setState(() {
                  showPreview = value;
                });
              },
            ),
          ),
        ),

      ],
    );
  }
}

