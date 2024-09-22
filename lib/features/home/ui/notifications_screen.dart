import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/features/home/ui/widgets/notification_item.dart';
import '../../../core/theming/colors_manger.dart';
import '../../../core/theming/styles.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsManager.white,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            CupertinoIcons.back,
            size: 32,
            color: ColorsManager.jetBlack,
          ),
        ),
        title: Text(
          'Notifications',
          style: TextStyles.font20JetBlackSemiBold,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(20),
            Expanded(
              child: ListView(
                children: const [
                  NotificationItem(
                    imageUrl: 'assets/svgs/default_profile.svg',
                    name: 'Ibrahim Magdy',
                    description: 'shared a post now',
                    time: '5m',
                  ),
                  NotificationItem(
                    imageUrl: 'assets/svgs/default_profile.svg',
                    name: 'Mohamed Ali, Esraa Morsii',
                    description: 'and 10  other liked to a post that you shared',
                    time: '1h',
                  ),
                  NotificationItem(
                    imageUrl: 'assets/svgs/default_profile.svg',
                    name: 'Yara Ayman',
                    description: 'commented on your post',
                    time: '2h',
                  ),
                  NotificationItem(
                    imageUrl: 'assets/svgs/default_profile.svg',
                    name: 'Ibrahim Magdy',
                    description: 'shared a post now',
                    time: '8h',
                  ),
                  NotificationItem(
                    imageUrl: 'assets/svgs/default_profile.svg',
                    name: 'Esraa Morsii ',
                    description: 'commented on your post',
                    time: '10h',
                  ),
                  NotificationItem(
                    imageUrl: 'assets/svgs/default_profile.svg',
                    name: 'Ibrahim Magdy',
                    description: 'shared a post now',
                    time: '12h',
                  ),
                  NotificationItem(
                    imageUrl: 'assets/svgs/default_profile.svg',
                    name: 'Yara Ayman',
                    description: 'shared a post now',
                    time: '16h',
                  ),
                  NotificationItem(
                    imageUrl: 'assets/svgs/default_profile.svg',
                    name: 'Esraa Morsii',
                    description: 'shared a post now',
                    time: '1D',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
