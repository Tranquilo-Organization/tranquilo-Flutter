import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';


class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: ColorsManager.jetBlack),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Create Post', style: TextStyles.font20OceanBlueSemiBold),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: TextButton(
              onPressed: () {},
              child: Text('Post', style: TextStyles.font16WhiteSemiBold),
              style: TextButton.styleFrom(
                backgroundColor: ColorsManager.oceanBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(16),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: ColorsManager.lighterSilver,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Post anonymously', style: TextStyles.font16JetBlackRegular),
                  Switch(value: false, onChanged: (value) {}),
                ],
              ),
            ),
            verticalSpace(20),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/svgs/anonymous.svg'), // Changed to your asset
                  radius: 24.w,
                ),
                horizontalSpace(12),
                Text('Esraa Morsii', style: TextStyles.font16JetBlackMedium),
              ],
            ),
            verticalSpace(20),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "What's on your mind?",
                hintStyle: TextStyles.font14JetBlackRegular,
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
