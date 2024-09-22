import 'package:flutter/material.dart';
import '../../../../core/theming/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/posts_cubit/posts_cubit.dart';
import 'package:tranquilo_app/core/animations/custom_loading_widget.dart';
import 'package:tranquilo_app/features/community/ui/widgets/post_widget.dart';

class PostsBlocBuilder extends StatelessWidget {
  const PostsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubit, PostsState>(
      listener: (context, state) {
        state.maybeWhen(
            createPostSuccess: (_){
              debugPrint("============================= \nlisten");
              context.read<PostsCubit>().fetchPosts();
            }, orElse: () {  }
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => SliverToBoxAdapter(
            child: Center(
              child: Text(
                'No posts yet',
                style: TextStyles.font14JetBlackMedium,
              ),
            ),
          ),
          postsLoading: () => const CustomLoadingWidget(),
          postsSuccess: (posts) {
            debugPrint("================================\nbuild");
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: posts.length,
                (context, index) {
                  return PostWidget(post: posts[index]);
                },
              ),
            );
          },

          postsError: (error) {
            return SliverToBoxAdapter(
              child: Text(
                error.message,
                style: TextStyles.font14JetBlackMedium,
              ),
            );
          },
          createPostLoading: () => const CustomLoadingWidget(),
          createPostSuccess: (response) {
            // Handle success, maybe show a message or update the UI
            return SliverToBoxAdapter(
              child: Text(
                'Post created successfully!',
                style: TextStyles.font14JetBlackMedium,
              ),
            );
          },
          createPostError: (error) {
            return SliverToBoxAdapter(
              child: Text(
                error.message,
                style: TextStyles.font14JetBlackMedium,
              ),
            );
          },
          orElse: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
        );
      },
    );
  }
}
