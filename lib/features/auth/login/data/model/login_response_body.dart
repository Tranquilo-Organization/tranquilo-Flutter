import 'package:json_annotation/json_annotation.dart';

part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponseBody {
  final String token;
  final String expireDate;
  final String email;
  final String id;
  final String userName;

  LoginResponseBody({
    required this.token,
    required this.expireDate,
    required this.email,
    required this.id,
    required this.userName,
  });

  /// A factory constructor for creating a new `LoginResponseBody` instance
  /// from a map (which is the deserialized JSON).
  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);

  /// A method that serializes the `LoginResponseBody` instance to a map
  /// (which will be serialized into JSON).
  Map<String, dynamic> toJson() => _$LoginResponseBodyToJson(this);
}

