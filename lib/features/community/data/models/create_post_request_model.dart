import 'package:json_annotation/json_annotation.dart';

part 'create_post_request_model.g.dart'; // Generated code will go here

@JsonSerializable()
class CreatePostRequestModel {
  final String postText;
  final String userId;

  CreatePostRequestModel({required this.postText, required this.userId});

  factory CreatePostRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreatePostRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePostRequestModelToJson(this);
}
