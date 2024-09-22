// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponseModel _$ProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProfileResponseModel(
      model: Model.fromJson(json['model'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$ProfileResponseModelToJson(
        ProfileResponseModel instance) =>
    <String, dynamic>{
      'model': instance.model,
      'statusCode': instance.statusCode,
    };

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      id: json['id'] as String,
      profilePicture: json['profilePicture'] as String?,
      nickName: json['nickName'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      levelName: json['levelName'] as String,
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'id': instance.id,
      'profilePicture': instance.profilePicture,
      'nickName': instance.nickName,
      'userName': instance.userName,
      'email': instance.email,
      'levelName': instance.levelName,
    };
