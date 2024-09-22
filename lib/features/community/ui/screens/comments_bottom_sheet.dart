import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/di/dependency_injection.dart';
import 'package:tranquilo_app/features/community/ui/widgets/comments_list_view.dart';
import 'package:tranquilo_app/features/community/logic/comments_cubit/comments_cubit.dart';
import 'package:tranquilo_app/features/community/ui/widgets/comments_text_field.dart'; // Assuming you have DI setup

class CommentsBottomSheet extends StatelessWidget {
  final ScrollController scrollController;

  const CommentsBottomSheet({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CommentsCubit>()..fetchComments(),
      child: Container(
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
              style: TextStyles.font16WhiteSemiBold
                  .copyWith(color: ColorsManager.oceanBlue),
            ),
            verticalSpace(16),
            Expanded(
              child: BlocBuilder<CommentsCubit, CommentsState>(
                builder: (context, state) {
                  return state.when(
                    initial: () =>
                        const Center(child: CircularProgressIndicator()),
                    commentsLoading: () =>
                        const Center(child: CircularProgressIndicator()),
                    commentsSuccess: (comments) =>
                        CommentsListView(comments: comments),
                    commentsError: (error) => Center(
                      child: Text(
                        'Failed to load comments: ${error.message}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                },
              ),
            ),
            const CommentsTextField(),
          ],
        ),
      ),
    );
  }
}
