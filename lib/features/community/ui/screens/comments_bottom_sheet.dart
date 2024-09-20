import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/features/community/ui/widgets/comments_list_view.dart';
import 'package:tranquilo_app/features/community/ui/widgets/comments_text_field.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_manger.dart';
import '../../../../core/theming/styles.dart';

class CommentsBottomSheet extends StatelessWidget {
  final ScrollController scrollController;

  const CommentsBottomSheet({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Comments',
            style: TextStyles.font16WhiteSemiBold.copyWith(color: ColorsManager.oceanBlue),
          ),
          verticalSpace(16),
          // Pass the scrollController to the ListView
          Expanded(
            child: CommentsListView(scrollController: scrollController),
          ),
          const CommentsTextField(),
        ],
      ),
    );
  }
}
