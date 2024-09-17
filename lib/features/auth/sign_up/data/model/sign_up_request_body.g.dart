// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestBody _$SignupRequestBodyFromJson(Map<String, dynamic> json) =>
    SignupRequestBody(
      name: json['userName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['confirmPassword'] as String,
    );

Map<String, dynamic> _$SignupRequestBodyToJson(SignupRequestBody instance) =>
    <String, dynamic>{
      'userName': instance.name,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.passwordConfirmation,
    };
