import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/features/community/data/model/post.dart';
import 'package:tranquilo_app/features/community/ui/widgets/post.dart';
import 'package:tranquilo_app/features/community/ui/widgets/create_post_widget.dart';
// lib/screens/community_post_screen.dart


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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Community',
                  style: TextStyles.font20OceanBlueSemiBold,
                ),
              ),
              verticalSpace(20),
              const CreatePostWidget(),
              verticalSpace(20),
              Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return PostWidget(post: post);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
