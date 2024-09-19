import 'package:json_annotation/json_annotation.dart';

part 'chatbot_request_model.g.dart';

@JsonSerializable()
class ChatbotRequestModel {
  final String msg;

  ChatbotRequestModel({required this.msg});

  // Factory constructor for creating a new instance from a map
  factory ChatbotRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ChatbotRequestModelFromJson(json);

  // Method for converting class instance to JSON
  Map<String, dynamic> toJson() => _$ChatbotRequestModelToJson(this);
}
