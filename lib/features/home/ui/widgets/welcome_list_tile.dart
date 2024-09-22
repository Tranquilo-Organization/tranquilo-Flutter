import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:tranquilo_app/core/theming/styles.dart';

class WelcomeListTile extends StatelessWidget {
  const WelcomeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Welcome Guest',
        style: TextStyles.font16JetBlackMedium,
      ),
      subtitle: Text(
        'Here’s your daily update',
        style: TextStyles.font12DarkGreyLight,
      ),
      trailing: InkWell(
        onTap: (){
          context.pushNamed(Routes.notificationsScreen);
        },
        child: SvgPicture.asset('assets/svgs/notifications_home.svg'),
      ),
    );
  }
}
