import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';

// Sample Post Model
class Post {
  final String author;
  final String date;
  final String content;
  final int upvotes;
  final int downvotes;
  final int comments;

  Post({
    required this.author,
    required this.date,
    required this.content,
    required this.upvotes,
    required this.downvotes,
    required this.comments,
  });
}

// Sample list of posts (increased to 50 for better scrolling test)
final List<Post> posts = List.generate(50, (index) {
  return Post(
    author: "User $index",
    date: "${index + 1} August at ${index + 1}:00 PM",
    content: "This is a sample post content for user $index. "
        "It is a bit longer to test the scrolling behavior "
        "when there are many posts in the feed.",
    upvotes: 10 + index,
    downvotes: index,
    comments: 5 + index,
  );
});

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
              Container(
                height: 58.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1.0,
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundColor: ColorsManager.white,
                      child: SvgPicture.asset(
                        'assets/svgs/profile_pic.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    horizontalSpace(12.w),
                    Expanded(
                      child: Text(
                        "What's on your mind?",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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

// PostWidget to display individual posts
class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.containerSilver),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: ColorsManager.white,
                child: SvgPicture.asset('assets/svgs/profile_pic.svg'),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.author, style: TextStyles.font14JetBlackMedium),
                  Text(post.date, style: TextStyles.font12DarkGreyLight),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(post.content, style: TextStyles.font16JetBlackRegular),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: ColorsManager.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: ColorsManager.containerSilver),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svgs/upvote.svg'),
                        SizedBox(width: 4.w),
                        Text(post.upvotes.toString(),
                            style: TextStyles.font14JetBlackRegular),
                        SizedBox(width: 8.w),
                        Container(
                          height: 16.h,
                          width: 1.w,
                          color: Colors.grey.shade400, // Vertical divider line
                        ),
                        SizedBox(width: 8.w),
                        SvgPicture.asset('assets/svgs/downvote.svg'),
                        SizedBox(width: 4.w),
                        Text(post.downvotes.toString(),
                            style: TextStyles.font14JetBlackRegular),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: ColorsManager.containerSilver),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svgs/comment.svg'),
                    SizedBox(width: 4.w),
                    Text('${post.comments} Comments',
                        style: TextStyles.font14JetBlackRegular),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
