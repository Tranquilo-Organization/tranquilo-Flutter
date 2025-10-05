import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tranquilo_app/core/network/api_service.dart';
import 'package:tranquilo_app/core/network/dio_factory.dart';
import 'package:tranquilo_app/features/home/data/repo/routine_repo.dart';
import 'package:tranquilo_app/features/survey/data/repo/survey_repo.dart';
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

final surveyRepoProvider = Provider<SurveyRepo>((ref) {
  final classificationApiService =
      ref.watch(classificationModelApiServiceProvider);
  return SurveyRepo(classificationApiService);
});

final routineRepoProvider = Provider<RoutineRepo>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return RoutineRepo(apiService);
});
