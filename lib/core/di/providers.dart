import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tranquilo_app/core/network/api_service.dart';
import 'package:tranquilo_app/core/network/dio_factory.dart';
import 'package:tranquilo_app/features/chatbot/data/api/chat_bot_api_call.dart';
import 'package:tranquilo_app/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:tranquilo_app/features/survey/data/api/classification_model_api_call.dart';

// Dio instance provider
final dioProvider = Provider<Dio>((ref) {
  return DioFactory.getDio();
});

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiService(dio);
});

final chatbotApiServiceProvider = Provider<ChatbotApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return ChatbotApiService(dio);
});

final classificationModelApiServiceProvider =
    Provider<ClassificationModelApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return ClassificationModelApiService(dio);
});

final signupRepoProvider = Provider<SignupRepo>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return SignupRepo(apiService);
});
