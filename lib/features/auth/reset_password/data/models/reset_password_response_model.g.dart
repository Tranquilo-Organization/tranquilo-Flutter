// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordResponseModel _$ResetPasswordResponseModelFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordResponseModel(
      token: json['token'] as String,
      expireDate: json['expireDate'] as String,
      message: json['message'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$ResetPasswordResponseModelToJson(
        ResetPasswordResponseModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expireDate': instance.expireDate,
      'message': instance.message,
      'statusCode': instance.statusCode,
    };
