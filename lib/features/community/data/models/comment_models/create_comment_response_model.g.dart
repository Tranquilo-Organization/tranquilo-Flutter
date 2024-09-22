// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_comment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCommentResponseModel _$CreateCommentResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreateCommentResponseModel(
      commentId: (json['commentId'] as num).toInt(),
      message: json['message'] as String,
      notification: json['notifcation'] as String,
      profilePicture: json['profilePicture'] as String?,
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$CreateCommentResponseModelToJson(
        CreateCommentResponseModel instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'message': instance.message,
      'notifcation': instance.notification,
      'profilePicture': instance.profilePicture,
      'statusCode': instance.statusCode,
    };
