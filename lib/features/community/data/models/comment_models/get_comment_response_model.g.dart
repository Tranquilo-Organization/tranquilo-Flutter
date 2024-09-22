// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_comment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCommentResponseModel _$GetCommentResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetCommentResponseModel(
      model: (json['model'] as List<dynamic>)
          .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$GetCommentResponseModelToJson(
        GetCommentResponseModel instance) =>
    <String, dynamic>{
      'model': instance.model,
      'statusCode': instance.statusCode,
    };

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      id: (json['id'] as num).toInt(),
      commentText: json['commentText'] as String,
      upVoteCountLength: (json['upVoteCountLength'] as num).toInt(),
      downVoteCountLength: (json['downVoteCountLength'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      postID: (json['postID'] as num).toInt(),
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'commentText': instance.commentText,
      'upVoteCountLength': instance.upVoteCountLength,
      'downVoteCountLength': instance.downVoteCountLength,
      'date': instance.date.toIso8601String(),
      'userId': instance.userId,
      'userName': instance.userName,
      'postID': instance.postID,
    };
