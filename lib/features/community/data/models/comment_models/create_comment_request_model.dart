import 'package:json_annotation/json_annotation.dart';

part 'create_comment_request_model.g.dart';

@JsonSerializable()
class CreateCommentRequestModel {
  @JsonKey(name: 'commentText')
  final String commentText;

  @JsonKey(name: 'userEmail')
  final String userEmail;

  @JsonKey(name: 'postID')
  final int postID;

  CreateCommentRequestModel({
    required this.commentText,
    required this.userEmail,
    required this.postID,
  });

  /// A necessary factory constructor for creating a new `CreateCommentRequestModel` instance
  /// from a map. Pass the map to the generated `_$CreateCommentRequestModelFromJson()` constructor.
  factory CreateCommentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCommentRequestModelFromJson(json);

  /// `toJson` is the counterpart to `fromJson`.
  /// Pass the instance to the generated `_$CreateCommentRequestModelToJson()` method.
  Map<String, dynamic> toJson() => _$CreateCommentRequestModelToJson(this);
}
