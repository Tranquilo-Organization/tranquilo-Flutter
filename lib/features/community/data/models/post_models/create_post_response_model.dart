import 'package:json_annotation/json_annotation.dart';
part 'create_post_response_model.g.dart';

@JsonSerializable()
class CreatePostResponseModel {
  final int postId;
  final String message;
  final String notifcation;
  final String? profilePicture;
  final int statusCode;

  CreatePostResponseModel({
    required this.postId,
    required this.message,
    required this.notifcation,
    this.profilePicture,
    required this.statusCode,
  });

  factory CreatePostResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreatePostResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePostResponseModelToJson(this);
}
