import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignupResponse {
  String? token;
  String? expireDate;
  String? email;
  String? id;
  String? userName;

  SignupResponse({
    this.token,
    this.expireDate,
    this.email,
    this.id,
    this.userName,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}
