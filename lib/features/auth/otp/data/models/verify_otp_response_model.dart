import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_response_model.g.dart';

@JsonSerializable()
class VerifyOtpResponseModel {
  final String message;
  final int statusCode;

  VerifyOtpResponseModel({
    required this.message,
    required this.statusCode,
  });

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpResponseModelToJson(this);
}
