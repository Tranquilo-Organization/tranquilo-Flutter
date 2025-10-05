import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/animations/custom_loading_widget.dart';
import 'package:tranquilo_app/features/community/ui/widgets/comments_list_view.dart';
import 'package:tranquilo_app/features/community/ui/widgets/comments_text_field.dart';
import 'package:tranquilo_app/features/community/logic/providers/comments_provider.dart';
import 'package:tranquilo_app/features/community/data/models/post_models/post_response.dart';

class CommentsBottomSheet extends ConsumerStatefulWidget {
  final ScrollController scrollController;
  final Post post;

  const CommentsBottomSheet({
    super.key,
    required this.scrollController,
    required this.post,
  });

  @override
  ConsumerState<CommentsBottomSheet> createState() =>
      _CommentsBottomSheetState();
}

class _CommentsBottomSheetState extends ConsumerState<CommentsBottomSheet> {
  @override
  void initState() {
    super.initState();
    // Set post and fetch comments
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(commentsProvider.notifier).setPost(widget.post);
      ref.read(commentsProvider.notifier).fetchComments();
    });
  }

  @override
  Widget build(BuildContext context) {
    final commentsAsync = ref.watch(commentsProvider);

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
            style: TextStyles.font16WhiteSemiBold
                .copyWith(color: ColorsManager.oceanBlue),
          ),
          verticalSpace(16),
          Expanded(
            child: commentsAsync.when(
              data: (comments) => CommentsListView(comments: comments),
              loading: () => const Center(child: CustomLoadingWidget()),
              error: (error, stackTrace) => Center(
                child: Text(
                  'Failed to load comments: $error',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          ),
          CommentsTextField(postId: widget.post.id),
        ],
      ),
    );
  }
}
