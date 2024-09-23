import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import '../widgets/app_bar_profile_screens.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(20),
              const AppBarProfileScreens(titleAppBar: 'Privacy'),
              verticalSpace(32),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  "Your privacy is important to us. It is Brainstorming's policy to respect your privacy regarding any information we may collect from you.",
                  style: TextStyles.font16JetBlackRegular.copyWith(color: ColorsManager.darkGrey),
                ),
              ),
              verticalSpace(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  'We only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we’re collecting it and how it will be used.'
                      'We only retain collected information for as long as necessary to provide you with your requested service. What data we store, we’ll protect within commercially acceptable means to prevent loss and theft, as well as unauthorized access, disclosure, copying, use or modification.'
                      'We don’t share any personally identifying information publicly or with third-parties, except when required to by law.',
                  style: TextStyles.font16JetBlackRegular.copyWith(color: ColorsManager.darkGrey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
