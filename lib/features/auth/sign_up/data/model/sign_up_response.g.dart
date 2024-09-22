// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      token: json['token'] as String?,
      expireDate: json['expireDate'] as String?,
      email: json['email'] as String?,
      id: json['id'] as String?,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expireDate': instance.expireDate,
      'email': instance.email,
      'id': instance.id,
      'userName': instance.userName,
    };
