import 'package:json_annotation/json_annotation.dart';
part 'create_post_request_model.g.dart';

@JsonSerializable()
class CreatePostRequestModel {
  @JsonKey(name: 'PostText')
  final String postText;

  @JsonKey(name: 'UserEmail')
  final String userEmail;

  CreatePostRequestModel({required this.postText, required this.userEmail});

  factory CreatePostRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreatePostRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePostRequestModelToJson(this);
}
