import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tranquilo_app/core/network/api_error_model.dart';
import 'package:tranquilo_app/features/chatbot/data/model/chatbot_request_model.dart';
import 'package:tranquilo_app/features/chatbot/data/model/chatbot_response_model.dart';
part 'chatbot_state.freezed.dart';

@freezed
class ChatbotState with _$ChatbotState {
  const factory ChatbotState.initial() = _Initial;

  const factory ChatbotState.loading() = Loading;

  // Updated success factory to take both request and response arguments
  const factory ChatbotState.success({
    required ChatbotRequestModel request,
    required ChatbotResponseModel response,
  }) = Success;

  const factory ChatbotState.error({required ApiErrorModel error}) = Error;
}
