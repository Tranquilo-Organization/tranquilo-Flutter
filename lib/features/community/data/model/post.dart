// lib/models/post_model.dart
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

// Sample list of posts for testing
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
