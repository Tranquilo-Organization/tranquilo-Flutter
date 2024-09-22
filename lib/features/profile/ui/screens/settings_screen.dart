import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/show_dialog.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/features/profile/logic/profile_cubit.dart';
import 'package:tranquilo_app/features/profile/ui/widgets/app_bar_profile_screens.dart';
import 'package:tranquilo_app/features/profile/ui/widgets/interface_card.dart';
import 'package:tranquilo_app/features/profile/ui/widgets/language_card.dart';
import 'package:tranquilo_app/features/profile/ui/widgets/support_card.dart';

import '../../../../core/helpers/spacing.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(20),
              const AppBarProfileScreens(titleAppBar: 'Settings'),
              verticalSpace(40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Interface',
                      style: TextStyles.font16JetBlackMedium,
                      textAlign: TextAlign.start,
                    ),
                    verticalSpace(6),
                    const InterfaceCard(),
                    verticalSpace(32),
                    Text(
                      'Language & regoin',
                      style: TextStyles.font16JetBlackMedium,
                      textAlign: TextAlign.start,
                    ),
                    verticalSpace(6),
                    const LanguageCard(),
                    verticalSpace(24),
                    Text(
                      'Support',
                      style: TextStyles.font16JetBlackMedium,
                      textAlign: TextAlign.start,
                    ),
                    verticalSpace(6),
                    SupportCard(
                      userProfileCubit:
                          context.read<UserProfileCubit>(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
