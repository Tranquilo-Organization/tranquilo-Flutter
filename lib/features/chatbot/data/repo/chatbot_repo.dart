import 'package:tranquilo_app/core/network/api_result.dart';
import 'package:tranquilo_app/core/network/api_service.dart';
import 'package:tranquilo_app/core/network/api_error_handler.dart';
import 'package:tranquilo_app/features/chatbot/data/model/chatbot_request_model.dart';
import 'package:tranquilo_app/features/chatbot/data/model/chatbot_response_model.dart';

class ChatbotRepo {
  final ApiService _apiService;

  ChatbotRepo(this._apiService);

  Future<ApiResult<ChatbotResponseModel>> getChatbotResponse(
      ChatbotRequestModel requestModel) async {
    try {
      final response = await _apiService.getChatbotResponse(requestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
