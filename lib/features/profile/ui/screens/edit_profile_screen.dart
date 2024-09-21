import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';
import 'package:tranquilo_app/features/profile/ui/widgets/app_bar_profile_screens.dart';
import 'package:tranquilo_app/features/profile/ui/widgets/edit_profile_info.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(20),
            const AppBarProfileScreens(titleAppBar: 'Edit Profile'),
            verticalSpace(32),
            Stack(
              children: [
                SizedBox(
                  width: 134.w,
                  height: 134.h,
                  child: ClipOval(
                    child: SvgPicture.asset('assets/svgs/default_profile.svg'),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SvgPicture.asset('assets/svgs/edit_profile_pic.svg'),
                ),
              ],
            ),
            verticalSpace(40),
            const EditProfileInfo(infoTitle: 'Full Name'),
             verticalSpace(18),
             const EditProfileInfo(infoTitle: 'Email'),
            const Spacer(),
            AppTextButton(
              onPressed: () {},
              textButton: 'Save',
            ),
            verticalSpace(35),
          ],
        ),
      ),
    );
  }
}

