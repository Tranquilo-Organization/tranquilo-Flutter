import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tranquilo_app/core/network/api_service.dart';
import 'package:tranquilo_app/core/network/dio_factory.dart';
import 'package:tranquilo_app/features/home/logic/routine_cubit.dart';
import 'package:tranquilo_app/features/survey/logic/survey_cubit.dart';
import 'package:tranquilo_app/features/home/data/repo/routine_repo.dart';
import 'package:tranquilo_app/features/chatbot/logic/chatbot_cubit.dart';
import 'package:tranquilo_app/features/survey/data/repo/survey_repo.dart';
import 'package:tranquilo_app/features/community/data/repos/post_repo.dart';
import 'package:tranquilo_app/features/chatbot/data/repo/chatbot_repo.dart';
import 'package:tranquilo_app/features/auth/login/data/repo/login_repo.dart';
import 'package:tranquilo_app/features/auth/otp/logic/verify_otp_cubit.dart';
import 'package:tranquilo_app/features/community/data/repos/comment_repo.dart';
import 'package:tranquilo_app/features/chatbot/data/api/chat_bot_api_call.dart';
import 'package:tranquilo_app/features/auth/otp/data/repo/verify_otp_repo.dart';
import 'package:tranquilo_app/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:tranquilo_app/features/community/logic/posts_cubit/posts_cubit.dart';
import 'package:tranquilo_app/features/auth/login/logic/login_cubit/login_cubit.dart';
import 'package:tranquilo_app/features/community/logic/comments_cubit/comments_cubit.dart';
import 'package:tranquilo_app/features/survey/data/api/classification_model_api_call.dart';
import 'package:tranquilo_app/features/auth/reset_password/logic/reset_password_cubit.dart';
import 'package:tranquilo_app/features/auth/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:tranquilo_app/features/auth/reset_password/data/repo/reset_password_repo.dart';
import 'package:tranquilo_app/features/auth/forget_password/data/repo/forget_password_repo.dart';
import 'package:tranquilo_app/features/auth/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<ChatbotApiService>(() => ChatbotApiService(dio));
  getIt.registerLazySingleton<ClassificationModelApiService>(
      () => ClassificationModelApiService(dio));
  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  // sign up
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  // forget password
  getIt.registerLazySingleton<ForgetPasswordRepo>(
      () => ForgetPasswordRepo(getIt()));
  getIt
      .registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(getIt()));

  // verify otp
  getIt.registerLazySingleton<VerifyOtpRepo>(() => VerifyOtpRepo(getIt()));
  getIt.registerFactory<VerifyOtpCubit>(() => VerifyOtpCubit(getIt()));

  // reset password
  getIt.registerLazySingleton<ResetPasswordRepo>(
      () => ResetPasswordRepo(getIt()));
  getIt.registerFactory<ResetPasswordCubit>(() => ResetPasswordCubit(getIt()));
  // chatbot
  getIt.registerLazySingleton<ChatbotRepo>(() => ChatbotRepo(getIt()));
  getIt.registerFactory<ChatbotCubit>(() => ChatbotCubit(getIt()));
  // Posts
  getIt.registerLazySingleton<PostRepo>(() => PostRepo(getIt()));
  getIt.registerFactory<PostsCubit>(() => PostsCubit(getIt()));
  //survey
  getIt.registerLazySingleton<SurveyRepo>(() => SurveyRepo(getIt()));
  getIt.registerLazySingleton<SurveyCubit>(() => SurveyCubit(getIt()));
//routine
  getIt.registerLazySingleton<RoutineRepo>(() => RoutineRepo(getIt()));
  getIt.registerFactory<RoutineCubit>(() => RoutineCubit(getIt()));

    getIt.registerLazySingleton<CommentRepo>(() => CommentRepo(getIt()));
  getIt.registerFactory<CommentsCubit>(() => CommentsCubit(getIt()));
}
