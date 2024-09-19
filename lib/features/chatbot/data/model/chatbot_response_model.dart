import 'package:json_annotation/json_annotation.dart';

part 'chatbot_response_model.g.dart';

@JsonSerializable()
class ChatbotResponseModel {
  final String response;

  ChatbotResponseModel({required this.response});

  factory ChatbotResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatbotResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatbotResponseModelToJson(this);
}
