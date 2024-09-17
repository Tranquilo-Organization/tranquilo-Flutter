import 'package:json_annotation/json_annotation.dart';

part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponseBody {
  final String token;
  final String expireDate;

  LoginResponseBody({
    required this.token,
    required this.expireDate,
  });

  /// A factory constructor for creating a new `LoginResponseBody` instance
  /// from a map (which is the deserialized JSON).
  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);

  /// A method that serializes the `LoginResponseBody` instance to a map
  /// (which will be serialized into JSON).
  Map<String, dynamic> toJson() => _$LoginResponseBodyToJson(this);
}
