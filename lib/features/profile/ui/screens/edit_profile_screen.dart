import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';
import 'package:tranquilo_app/features/profile/logic/profile_cubit.dart';
import 'package:tranquilo_app/features/profile/logic/profile_state.dart';
import 'package:tranquilo_app/features/profile/ui/widgets/edit_profile_info.dart';
import 'package:tranquilo_app/features/profile/data/model/profile_response_model.dart';
import 'package:tranquilo_app/features/profile/ui/widgets/app_bar_profile_screens.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<UserProfileCubit, UserProfileState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(
                  child:
                      CircularProgressIndicator()), // Change initial to show loading
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (profile) => buildProfileScreen(profile.model),
              failure: (error) =>
                  const Center(child: Text('Failed to load profile')),
            );
          },
        ),
      ),
    );
  }

  Widget buildProfileScreen(Model profile) {
    return Column(
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
        EditProfileInfo(infoTitle: 'Full Name', initialValue: profile.userName),
        verticalSpace(18),
        EditProfileInfo(infoTitle: 'Email', initialValue: profile.email),
        const Spacer(),
        AppTextButton(
          onPressed: () {
            // Implement save action
          },
          textButton: 'Save',
        ),
        verticalSpace(35),
      ],
    );
  }
}
