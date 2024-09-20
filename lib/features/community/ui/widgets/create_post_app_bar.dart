import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import '../../../../core/theming/colors_manger.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_button.dart';

class CreatePostAppBar extends StatelessWidget {
  const CreatePostAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.white,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.close, color: ColorsManager.jetBlack),
        onPressed: () {
          context.pop();
        },
      ),
      title: Text(
        'Create Post',
        style: TextStyles.font20OceanBlueSemiBold,
      ),
      actions: [
        AppTextButton(
          onPressed: (){},
          textButton: 'Post',
          width: 66.w,
          height: 37.h,
          padding: EdgeInsets.symmetric(vertical: 4.h),
          fontSize: 14,
        ),
      ],
    );
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     IconButton(
    //       icon: const Icon(Icons.close, color: ColorsManager.jetBlack),
    //       onPressed: () {
    //         context.pop();
    //       },
    //     ),
    //     Text(
    //       'Create Post',
    //       style: TextStyles.font20OceanBlueSemiBold,
    //     ),
    //     AppTextButton(
    //       onPressed: (){},
    //       textButton: 'Post',
    //       width: 66.w,
    //       height: 37.h,
    //       padding: EdgeInsets.symmetric(vertical: 4.h),
    //       fontSize: 14,
    //     ),
    //   ],
    // ),
  }
}
