import 'package:json_annotation/json_annotation.dart';

part 'create_post_response_model.g.dart'; // Generated code will go here

@JsonSerializable()
class CreatePostResponseModel {
  final int commentId;
  final String message;
  final String notification;
  final String? profilePicture;
  final int statusCode;

  CreatePostResponseModel({
    required this.commentId,
    required this.message,
    required this.notification,
    this.profilePicture,
    required this.statusCode,
  });

  factory CreatePostResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreatePostResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePostResponseModelToJson(this);
}
