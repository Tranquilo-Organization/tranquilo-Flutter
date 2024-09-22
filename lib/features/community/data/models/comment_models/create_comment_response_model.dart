import 'package:json_annotation/json_annotation.dart';

part 'create_comment_response_model.g.dart';

@JsonSerializable()
class CreateCommentResponseModel {
  @JsonKey(name: 'commentId')
  final int commentId;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'notifcation')
  final String notification;

  @JsonKey(name: 'profilePicture')
  final String? profilePicture;

  @JsonKey(name: 'statusCode')
  final int statusCode;

  CreateCommentResponseModel({
    required this.commentId,
    required this.message,
    required this.notification,
    this.profilePicture,
    required this.statusCode,
  });

  /// Factory constructor for creating `CreateCommentResponseModel` from JSON.
  factory CreateCommentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCommentResponseModelFromJson(json);

  /// Method to convert `CreateCommentResponseModel` instance to JSON.
  Map<String, dynamic> toJson() => _$CreateCommentResponseModelToJson(this);
}
