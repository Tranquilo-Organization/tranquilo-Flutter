// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePostRequestModel _$CreatePostRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreatePostRequestModel(
      postText: json['PostText'] as String,
      userEmail: json['UserEmail'] as String,
    );

Map<String, dynamic> _$CreatePostRequestModelToJson(
        CreatePostRequestModel instance) =>
    <String, dynamic>{
      'PostText': instance.postText,
      'UserEmail': instance.userEmail,
    };
