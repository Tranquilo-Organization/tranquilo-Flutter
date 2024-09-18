import 'package:json_annotation/json_annotation.dart';

part 'reset_password_response_model.g.dart';

@JsonSerializable()
class ResetPasswordResponseModel {
  final String token;
  final String expireDate;
  final String message;
  final int statusCode;

  ResetPasswordResponseModel({
    required this.token,
    required this.expireDate,
    required this.message,
    required this.statusCode,
  });

  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordResponseModelToJson(this);
}
