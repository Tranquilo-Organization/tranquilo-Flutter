// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePostResponseModel _$CreatePostResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreatePostResponseModel(
      postId: (json['postId'] as num).toInt(),
      message: json['message'] as String,
      notifcation: json['notifcation'] as String,
      profilePicture: json['profilePicture'] as String?,
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$CreatePostResponseModelToJson(
        CreatePostResponseModel instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'message': instance.message,
      'notifcation': instance.notifcation,
      'profilePicture': instance.profilePicture,
      'statusCode': instance.statusCode,
    };
