import 'package:tranquilo_app/core/network/api_result.dart';
import 'package:tranquilo_app/core/network/api_service.dart';
import 'package:tranquilo_app/core/network/api_error_handler.dart';
import 'package:tranquilo_app/features/chatbot/data/api/chat_bot_api_call.dart';
import 'package:tranquilo_app/features/chatbot/data/model/chatbot_request_model.dart';
import 'package:tranquilo_app/features/chatbot/data/model/chatbot_response_model.dart';

class ChatbotRepo {
  final ChatbotApiService _chatbotApiService;

  ChatbotRepo(this._chatbotApiService);

  Future<ApiResult<ChatbotResponseModel>> getChatbotResponse(
      ChatbotRequestModel requestModel) async {
    try {
      final response =
          await _chatbotApiService.getChatbotResponse(requestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
