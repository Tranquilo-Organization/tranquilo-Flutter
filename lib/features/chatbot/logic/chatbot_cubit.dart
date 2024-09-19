import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/core/network/api_error_handler.dart';
import 'package:tranquilo_app/features/chatbot/data/repo/chatbot_repo.dart';
import 'package:tranquilo_app/features/chatbot/data/model/chatbot_request_model.dart';
import 'package:tranquilo_app/features/chatbot/logic/chatbot_state.dart'; // Assuming you placed the ChatbotState here

class ChatbotCubit extends Cubit<ChatbotState> {
  final ChatbotRepo _chatbotRepo;

  ChatbotCubit(this._chatbotRepo) : super(const ChatbotState.initial());

  Future<void> getChatbotResponse(ChatbotRequestModel requestModel) async {
    emit(const ChatbotState.loading());

    try {
      final response = await _chatbotRepo.getChatbotResponse(requestModel);

      response.when(
        success: (chatbotResponse) {
          emit(ChatbotState.success(chatbotResponse));
        },
        failure: (error) {
          emit(ChatbotState.error(error: error.apiErrorModel));
        },
      );
    } catch (e) {
      emit(ChatbotState.error(error: ErrorHandler.handle(e).apiErrorModel));
    }
  }
}
