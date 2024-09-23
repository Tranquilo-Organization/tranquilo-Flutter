import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tranquilo_app/core/network/api_result.dart';
import 'package:tranquilo_app/core/network/api_error_model.dart';
import 'package:tranquilo_app/features/auth/login/data/repo/login_repo.dart';
import 'package:tranquilo_app/features/auth/login/logic/login_cubit/login_cubit.dart';
import 'package:tranquilo_app/features/auth/login/logic/login_cubit/login_state.dart';
import 'package:tranquilo_app/features/auth/login/data/model/login_request_body.dart';
import 'package:tranquilo_app/features/auth/login/data/model/login_response_body.dart';


@GenerateMocks([LoginRepo])
void main() {
  group('LoginCubit Tests', () {
    late LoginCubit loginCubit;
    late MockLoginRepo mockLoginRepo;

    setUp(() {
      mockLoginRepo = MockLoginRepo();
      loginCubit = LoginCubit(mockLoginRepo);
    });

    test('emits loading and success when login is successful', () async {
      const email = 'test@example.com';
      const password = 'password123';
      final loginResponse = LoginResponseBody(
        token: 'dummy_token',
        expireDate: '2025-01-01',
        email: email,
        id: '1',
        userName: 'test_user',
      );

      when(mockLoginRepo.login(any)).thenAnswer(
        (_) async => ApiResult.success(loginResponse),
      );

      expectLater(
        loginCubit.stream,
        emitsInOrder([
          const LoginState.loading(),
          LoginState.success(loginResponse),
        ]),
      );

      loginCubit.emitLoginStates(email, password);
    });

    test('emits loading and error when login fails', () async {
      const email = 'test@example.com';
      const password = 'password123';
      final apiError = ApiErrorModel(
        message: 'Invalid credentials',
        statusCode: 401,
      );

      when(mockLoginRepo.login(any)).thenAnswer(
        (_) async => ApiResult.failure(apiError),
      );

      expectLater(
        loginCubit.stream,
        emitsInOrder([
          const LoginState.loading(),
          LoginState.error(error: apiError),
        ]),
      );

      loginCubit.emitLoginStates(email, password);
    });
  });
}