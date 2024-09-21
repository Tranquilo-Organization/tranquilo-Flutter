import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/widgets/switch_widget.dart';
import 'package:tranquilo_app/features/community/ui/widgets/create_post_app_bar.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  bool isAnonymous = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(16),
            const CreatePostAppBar(),
            verticalSpace(16),
            Container(
              width: double.infinity,
              height: 47.h,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: ColorsManager.oceanBlue.withOpacity(0.14),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Post anonymously',
                      style: TextStyles.font14OceanBlueRegular,
                    ),
                    SwitchWidget(
                      value: isAnonymous,
                      onChanged: (value) {
                        setState(() {
                          isAnonymous = value;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            verticalSpace(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  ClipOval(
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      color: Colors.transparent,
                      child: SvgPicture.asset(
                        isAnonymous
                            ? 'assets/svgs/anonymous.svg'
                            : 'assets/svgs/default_profile.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  horizontalSpace(12),
                  Text(
                    isAnonymous ? 'Anonymous' : 'Guest',
                    style: TextStyles.font16JetBlackMedium,
                  ),
                ],
              ),
            ),
            verticalSpace(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: isAnonymous
                      ? 'Submit an anonymous post...'
                      : "What's on your mind?",
                  hintStyle: TextStyles.font14JetBlackRegular,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
