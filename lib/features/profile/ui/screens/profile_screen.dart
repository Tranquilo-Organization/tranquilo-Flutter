import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/features/profile/ui/screens/logout_dialog.dart';
import 'package:tranquilo_app/features/profile/ui/widgets/profile_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                verticalSpace(20),
                Text(
                  'Profile',
                  style: TextStyles.font20JetBlackSemiBold,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(32),
                SizedBox(
                  width: 134.w,
                  height: 134.h,
                  child: ClipOval(
                    child: SvgPicture.asset('assets/svgs/default_profile.svg'),
                  ),
                ),
                verticalSpace(20),
                ProfileListTile(
                  onTap: (){
                    context.pushNamed(Routes.editProfileScreen);
                  },
                  icon: 'assets/svgs/edit_profile_icon.svg',
                  title: 'Edit Profile',
                ),
                verticalSpace(5),
                ProfileListTile(
                  onTap: (){
                    context.pushNamed(Routes.settingsProfileScreen);
                  },
                  icon: 'assets/svgs/settings_icon.svg',
                  title: 'Settings',
                ),
                verticalSpace(5),
                ProfileListTile(
                  onTap: (){
                    context.pushNamed(Routes.privacyPolicyScreen);
                  },
                  icon: 'assets/svgs/privacy_icon.svg',
                  title: 'Privacy Policy',
                ),
                verticalSpace(5),
                ProfileListTile(
                  onTap: (){
                    showLogoutDialog(context);
                  },
                  icon: 'assets/svgs/logout_icon.svg',
                  title: 'Logout',
                ),
                verticalSpace(5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
