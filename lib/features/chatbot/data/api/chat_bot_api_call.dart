import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tranquilo_app/core/network/api_constants.dart';
import 'package:tranquilo_app/features/chatbot/data/model/chatbot_request_model.dart';
import 'package:tranquilo_app/features/chatbot/data/model/chatbot_response_model.dart';

part 'chat_bot_api_call.g.dart';

@RestApi(baseUrl: ApiConstants.chatbotApiUrl)
abstract class ChatbotApiService {
  factory ChatbotApiService(Dio dio, {String baseUrl}) = _ChatbotApiService;

  @POST(ApiConstants.chatbot)
  Future<ChatbotResponseModel> getChatbotResponse(
    @Body() ChatbotRequestModel chatbotRequestModel,
  );
}
