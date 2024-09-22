// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePostResponseModel _$CreatePostResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreatePostResponseModel(
      commentId: (json['commentId'] as num).toInt(),
      message: json['message'] as String,
      notification: json['notification'] as String,
      profilePicture: json['profilePicture'] as String?,
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$CreatePostResponseModelToJson(
        CreatePostResponseModel instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'message': instance.message,
      'notification': instance.notification,
      'profilePicture': instance.profilePicture,
      'statusCode': instance.statusCode,
    };
