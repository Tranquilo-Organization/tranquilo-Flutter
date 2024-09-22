import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/di/dependency_injection.dart';
import 'package:tranquilo_app/features/community/data/models/post_models/post_response.dart';
import 'package:tranquilo_app/features/community/ui/widgets/comments_list_view.dart';
import 'package:tranquilo_app/features/community/logic/comments_cubit/comments_cubit.dart';
import 'package:tranquilo_app/features/community/ui/widgets/comments_text_field.dart';

class CommentsBottomSheet extends StatelessWidget {
  final ScrollController scrollController;
  final Post post;

  const CommentsBottomSheet({
    super.key,
    required this.scrollController,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return getIt<CommentsCubit>()
          ..post = post
          ..fetchComments();
      },
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
              child: BlocConsumer<CommentsCubit, CommentsState>(
                listener: (context, state) {
                  state.maybeWhen(
                    commentsError: (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Failed to load comments: ${error.message}',
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      );
                    },
                    orElse: () {},
                  );
                },
                buildWhen: (previous, current) {
                  if (current is CommentsLoading || current is CommentsSuccess){
                    return true;
                  }
                  return false;
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    commentsLoading: () =>
                        const Center(child: CircularProgressIndicator()),
                    commentsSuccess: (comments) =>
                        CommentsListView(comments: comments),
                    orElse: () => const Center(
                        child: Text('Unexpected state encountered')),
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
