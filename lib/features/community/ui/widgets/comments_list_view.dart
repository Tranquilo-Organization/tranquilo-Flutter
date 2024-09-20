import 'package:flutter/material.dart';
import 'package:tranquilo_app/features/community/ui/widgets/replay_widget.dart';
import 'comment_widget.dart';

class CommentsListView extends StatelessWidget {
  final ScrollController scrollController;

  const CommentsListView({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: const [
        CommentWidget(
          profileImage: 'assets/svgs/default_profile.svg',
          name: 'User 0',
          timeAgo: '14 min',
          comment:
          'I’ve been working on managing my anxiety for a while now. Deep breathing exercises and journaling help, but it’s still a struggle some days',
          likes: 2,
        ),
        ReplyWidget(
          profileImage: 'assets/svgs/default_profile.svg',
          name: 'User 1',
          timeAgo: '10 min',
          comment:
          'Anxiety can be so exhausting! It\'s like my mind is constantly racing, even when there\'s nothing to worry about',
        ),
        CommentWidget(
          profileImage: 'assets/svgs/default_profile.svg',
          name: 'User 1',
          timeAgo: '9 min',
          comment:
          'It took me a long time to understand my anxiety. Now I’m learning that it’s okay to not be okay. Small steps, every day.',
          likes: 0,
        ),
        CommentWidget(
          profileImage: 'assets/svgs/default_profile.svg',
          name: 'User 2',
          timeAgo: '9 min',
          comment:
          'It took me a long time to understand my anxiety. Now I’m learning that it’s okay to not be okay. Small steps, every day.',
          likes: 0,
        ),
        ReplyWidget(
          profileImage: 'assets/svgs/default_profile.svg',
          name: 'User 0',
          timeAgo: '10 min',
          comment:
          'Anxiety can be so exhausting! It\'s like my mind is constantly racing, even when there\'s nothing to worry about',
        ),
      ],
    );
  }
}
