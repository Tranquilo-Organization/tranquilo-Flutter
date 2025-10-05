import 'package:flutter/material.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/providers/posts_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tranquilo_app/core/animations/custom_loading_widget.dart';
import 'package:tranquilo_app/features/community/ui/widgets/post_widget.dart';

class PostsBlocBuilder extends ConsumerWidget {
  const PostsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postsProvider);

    return postsAsync.when(
      data: (posts) {
        if (posts.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                'No posts yet',
                style: TextStyles.font14JetBlackMedium,
              ),
            ),
          );
        }
        
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return PostWidget(post: posts[index]);
            },
            childCount: posts.length,
          ),
        );
      },
      loading: () => const SliverToBoxAdapter(
        child: CustomLoadingWidget(),
      ),
      error: (error, stackTrace) {
        return SliverToBoxAdapter(
          child: Center(
            child: Text(
              error.toString(),
              style: TextStyles.font14JetBlackMedium,
            ),
          ),
        );
      },
    );
  }
}