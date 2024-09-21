import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/features/community/ui/widgets/post_widget.dart';

import '../../../../core/theming/styles.dart';
import '../../logic/posts_cubit/posts_cubit.dart';

class PostsBlocBuilder extends StatelessWidget {
  const PostsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        return state.when(
          initial: () =>
              SliverToBoxAdapter(
                child: Center(child: Text(
                  'No posts yet',
                  style: TextStyles.font14JetBlackMedium,
                )),
              ),
          postsLoading: () => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
          postsSuccess: (posts) {
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
        );
      },
    );
  }
}
