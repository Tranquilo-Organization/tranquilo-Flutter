import 'package:flutter_bloc/flutter_bloc.dart';
part 'chatbot_state.dart';

class ChatbotCubit extends Cubit<ChatbotState> {
  ChatbotCubit() : super(ChatbotInitial());
}
