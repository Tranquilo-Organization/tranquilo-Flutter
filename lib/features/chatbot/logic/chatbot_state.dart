import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tranquilo_app/core/network/api_error_model.dart';
import 'package:tranquilo_app/features/chatbot/data/model/chatbot_request_model.dart';
import 'package:tranquilo_app/features/chatbot/data/model/chatbot_response_model.dart';
part 'chatbot_state.freezed.dart';

@freezed
class ChatbotState with _$ChatbotState {
  const factory ChatbotState.initial({@Default(true) bool showSuggestions}) = _Initial;

  const factory ChatbotState.loading() = Loading;

  const factory ChatbotState.success({
    required ChatbotRequestModel request,
    required ChatbotResponseModel response,
  }) = Success;

  const factory ChatbotState.error({required ApiErrorModel error}) = Error;
}

