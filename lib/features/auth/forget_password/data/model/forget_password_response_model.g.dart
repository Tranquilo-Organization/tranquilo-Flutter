// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordResponseModel _$ForgetPasswordResponseModelFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordResponseModel(
      message: json['message'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$ForgetPasswordResponseModelToJson(
        ForgetPasswordResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
    };
