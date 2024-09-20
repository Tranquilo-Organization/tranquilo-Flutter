import 'package:json_annotation/json_annotation.dart';
part 'post_response.g.dart';

@JsonSerializable()
class Post {
  final int id;
  final String postText;
  final int upVoteCountLength;
  final int downVoteCountLength;
  final int commentsCount;
  final String date;
  final String userId;
  final String userName;

  Post({
    required this.id,
    required this.postText,
    required this.upVoteCountLength,
    required this.downVoteCountLength,
    required this.commentsCount,
    required this.date,
    required this.userId,
    required this.userName,
  });

  /// A factory constructor for creating a new `Post` instance from a map.
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  /// A method that serializes the `Post` instance to a map.
  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@JsonSerializable()
class GetPostsResponseBody {
  final List<Post> result;
  final int statusCode;

  GetPostsResponseBody({
    required this.result,
    required this.statusCode,
  });

  factory GetPostsResponseBody.fromJson(Map<String, dynamic> json) =>
      _$GetPostsResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$GetPostsResponseBodyToJson(this);
}

