import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  @JsonKey(name: 'userName')
  final String name;
  final String email;
  final String password;
  @JsonKey(name: 'confirmPassword')
  final String passwordConfirmation;

  SignupRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}