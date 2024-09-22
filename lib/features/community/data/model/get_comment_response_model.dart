import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'get_comment_response_model.g.dart';

@JsonSerializable()
class GetCommentResponseModel {
  final List<CommentModel> model;
  final int statusCode;

  GetCommentResponseModel({required this.model, required this.statusCode});

  factory GetCommentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetCommentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCommentResponseModelToJson(this);
}

@JsonSerializable()
class CommentModel {
  final int id;
  final String commentText;
  final int upVoteCountLength;
  final int downVoteCountLength;
  final DateTime date;
  final String userId;
  final String userName;
  final int postID;

  CommentModel({
    required this.id,
    required this.commentText,
    required this.upVoteCountLength,
    required this.downVoteCountLength,
    required this.date,
    required this.userId,
    required this.userName,
    required this.postID,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}
