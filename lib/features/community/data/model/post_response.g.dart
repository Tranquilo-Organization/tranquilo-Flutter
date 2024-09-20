// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: (json['id'] as num).toInt(),
      postText: json['postText'] as String,
      upVoteCountLength: (json['upVoteCountLength'] as num).toInt(),
      downVoteCountLength: (json['downVoteCountLength'] as num).toInt(),
      commentsCount: (json['commentsCount'] as num).toInt(),
      date: json['date'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'postText': instance.postText,
      'upVoteCountLength': instance.upVoteCountLength,
      'downVoteCountLength': instance.downVoteCountLength,
      'commentsCount': instance.commentsCount,
      'date': instance.date,
      'userId': instance.userId,
      'userName': instance.userName,
    };

GetPostsResponseBody _$GetPostsResponseBodyFromJson(
        Map<String, dynamic> json) =>
    GetPostsResponseBody(
      result: (json['result'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$GetPostsResponseBodyToJson(
        GetPostsResponseBody instance) =>
    <String, dynamic>{
      'result': instance.result,
      'statusCode': instance.statusCode,
    };
