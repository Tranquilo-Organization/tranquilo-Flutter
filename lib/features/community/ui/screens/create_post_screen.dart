import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  bool isAnonymous = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Wrapping the widget in SafeArea
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16), // Space at the top after SafeArea
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close, color: ColorsManager.jetBlack),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    'Create Post',
                    style: TextStyles.font20OceanBlueSemiBold,
                  ),
                  SizedBox(
                    width: 66.w,
                    height: 37.h,
                    child: TextButton(
                      onPressed: () {
                        // Post action goes here
                      },
                      child:
                          Text('Post', style: TextStyles.font16WhiteSemiBold),
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
              verticalSpace(16),
              // Circular Container with given dimensions and full border-radius
              Container(
                width: 327.w,
                height: 47.h,
                decoration: BoxDecoration(
                  color: ColorsManager.lighterSilver
                      .withOpacity(1.0), // Ensure it's visible
                  borderRadius: BorderRadius.circular(
                      8.r), // All corners are circular now
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Post anonymously',
                          style: TextStyles.font14OceanBlueMedium),
                      Switch(
                        value: isAnonymous,
                        onChanged: (value) {
                          setState(() {
                            isAnonymous = value;
                          });
                        },
                        activeColor: ColorsManager
                            .oceanBlue, // Change the indicator color when active
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(20),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      isAnonymous
                          ? 'assets/images/logo.png'
                          : 'assets/svgs/second_morning_task.svg',
                    ),
                    radius: 24.w,
                  ),
                  horizontalSpace(12),
                  Text(
                    isAnonymous ? 'Anonymous' : 'Esraa Morsii',
                    style: TextStyles.font16JetBlackMedium,
                  ),
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
      ),
    );
  }
}
