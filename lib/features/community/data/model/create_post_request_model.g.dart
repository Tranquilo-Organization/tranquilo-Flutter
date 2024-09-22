// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePostRequestModel _$CreatePostRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreatePostRequestModel(
      postText: json['postText'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$CreatePostRequestModelToJson(
        CreatePostRequestModel instance) =>
    <String, dynamic>{
      'postText': instance.postText,
      'userId': instance.userId,
    };
