import 'package:json_annotation/json_annotation.dart';

part 'chatbot_response_model.g.dart';

@JsonSerializable()
class ChatbotResponseModel {
  final String response;

  ChatbotResponseModel({required this.response});

  // Factory constructor for creating a new instance from a map
  factory ChatbotResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatbotResponseModelFromJson(json);

  // Method for converting class instance to JSON
  Map<String, dynamic> toJson() => _$ChatbotResponseModelToJson(this);
}
