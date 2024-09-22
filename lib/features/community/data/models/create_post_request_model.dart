import 'package:json_annotation/json_annotation.dart';

part 'create_post_request_model.g.dart'; // Generated code will go here

@JsonSerializable()
class CreatePostRequestModel {
  @JsonKey(name: 'PostText')
  final String postText;

  @JsonKey(name: 'userEmail')
  final String userEmail;

  CreatePostRequestModel({required this.postText, required this.userEmail});

  factory CreatePostRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreatePostRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePostRequestModelToJson(this);
}
