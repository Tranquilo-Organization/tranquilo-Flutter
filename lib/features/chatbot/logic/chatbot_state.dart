import '../../../../../core/network/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chatbot_state.freezed.dart';

@freezed
class ChatbotState<T> with _$ChatbotState<T> {
  const factory ChatbotState.initial() = _Initial;

  const factory ChatbotState.loading() = Loading;

  const factory ChatbotState.success(T data) = Success<T>;

  const factory ChatbotState.error({required ApiErrorModel error}) = Error;
}
