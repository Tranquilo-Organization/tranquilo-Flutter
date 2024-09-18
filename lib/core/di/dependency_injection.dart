import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tranquilo_app/core/network/api_service.dart';
import 'package:tranquilo_app/core/network/dio_factory.dart';
import 'package:tranquilo_app/features/auth/login/data/repo/login_repo.dart';
import 'package:tranquilo_app/features/auth/otp/logic/verify_otp_cubit.dart';
import 'package:tranquilo_app/features/auth/otp/data/repo/verify_otp_repo.dart';
import 'package:tranquilo_app/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:tranquilo_app/features/auth/login/logic/login_cubit/login_cubit.dart';
import 'package:tranquilo_app/features/auth/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:tranquilo_app/features/auth/forget_password/data/repo/forget_password_repo.dart';
import 'package:tranquilo_app/features/auth/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
  // sign up
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerLazySingleton<SignUpCubit>(() => SignUpCubit(getIt()));

  // forget password
  getIt.registerLazySingleton<ForgetPasswordRepo>(
      () => ForgetPasswordRepo(getIt()));
  getIt.registerLazySingleton<ForgetPasswordCubit>(
      () => ForgetPasswordCubit(getIt()));

  // verify otp
  getIt.registerLazySingleton<VerifyOtpRepo>(() => VerifyOtpRepo(getIt()));
  getIt.registerLazySingleton<VerifyOtpCubit>(() => VerifyOtpCubit(getIt()));
}
