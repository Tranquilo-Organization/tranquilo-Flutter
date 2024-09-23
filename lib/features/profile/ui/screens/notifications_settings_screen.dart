import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/features/profile/ui/widgets/notifications_card.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../widgets/app_bar_profile_screens.dart';

class NotificationsSettingsScreen extends StatelessWidget {
  const NotificationsSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(20),
            const AppBarProfileScreens(titleAppBar: 'Notifications'),
            verticalSpace(40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Notifications',
                    style: TextStyles.font16JetBlackMedium,
                    textAlign: TextAlign.start,
                  ),
                  verticalSpace(6),
                  const NotificationsCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
