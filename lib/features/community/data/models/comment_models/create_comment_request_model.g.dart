// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_comment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCommentRequestModel _$CreateCommentRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateCommentRequestModel(
      commentText: json['commentText'] as String,
      userEmail: json['userEmail'] as String,
      postID: (json['postID'] as num).toInt(),
    );

Map<String, dynamic> _$CreateCommentRequestModelToJson(
        CreateCommentRequestModel instance) =>
    <String, dynamic>{
      'commentText': instance.commentText,
      'userEmail': instance.userEmail,
      'postID': instance.postID,
    };
