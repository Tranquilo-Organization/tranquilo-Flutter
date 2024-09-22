import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/features/community/logic/posts_cubit/posts_cubit.dart';
import 'package:tranquilo_app/features/community/ui/widgets/filter_widget.dart';
import 'package:tranquilo_app/features/community/ui/widgets/create_post_widget.dart';
import 'package:tranquilo_app/features/community/ui/widgets/posts_bloc_builder.dart';


class CommunityPostScreen extends StatefulWidget {
  const CommunityPostScreen({super.key});

  @override
  State<CommunityPostScreen> createState() => _CommunityPostScreenState();
}

class _CommunityPostScreenState extends State<CommunityPostScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => context.read<PostsCubit>().fetchPosts(),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      verticalSpace(20),
                      Text(
                        'Community',
                        style: TextStyles.font20JetBlackSemiBold,
                        textAlign: TextAlign.center,
                      ),
                      verticalSpace(20),
                      Row(
                        children: [
                          const CreatePostWidget(),
                          horizontalSpace(5),
                          const Expanded(
                            flex: 1,
                            child: FilterWidget(),
                          ),
                        ],
                      ),
                      verticalSpace(20),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                sliver: const PostsBlocBuilder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

