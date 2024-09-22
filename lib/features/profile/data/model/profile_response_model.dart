import 'package:json_annotation/json_annotation.dart';

part 'profile_response_model.g.dart';

@JsonSerializable()
class ProfileResponseModel {
  final Model model;
  final int statusCode;

  ProfileResponseModel({required this.model, required this.statusCode});

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);
}

@JsonSerializable()
class Model {
  final String id;
  final String? profilePicture;
  final String nickName;
  final String userName;
  final String email;
  final String levelName;

  Model({
    required this.id,
    this.profilePicture,
    required this.nickName,
    required this.userName,
    required this.email,
    required this.levelName,
  });

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

  Map<String, dynamic> toJson() => _$ModelToJson(this);
}
