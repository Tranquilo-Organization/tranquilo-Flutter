// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseBody _$LoginResponseBodyFromJson(Map<String, dynamic> json) =>
    LoginResponseBody(
      token: json['token'] as String,
      expireDate: json['expireDate'] as String,
      email: json['email'] as String,
      id: json['id'] as String,
      userName: json['userName'] as String,
    );

Map<String, dynamic> _$LoginResponseBodyToJson(LoginResponseBody instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expireDate': instance.expireDate,
      'email': instance.email,
      'id': instance.id,
      'userName': instance.userName,
    };
