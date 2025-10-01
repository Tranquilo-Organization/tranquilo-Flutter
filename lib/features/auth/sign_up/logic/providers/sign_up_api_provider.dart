import 'package:tranquilo_app/core/di/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tranquilo_app/core/helpers/constants.dart';
import 'package:tranquilo_app/core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/features/auth/sign_up/data/model/sign_up_response.dart';
import 'package:tranquilo_app/features/auth/sign_up/data/model/sign_up_request_body.dart';

/// AsyncNotifier for handling sign-up API operations
/// Separation: Only handles API calls and persistence, no form logic
class SignUpNotifier extends AsyncNotifier<SignupResponse?> {
  @override
  Future<SignupResponse?> build() async {
    return null;
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    state = const AsyncValue.loading();

    final repo = ref.read(signupRepoProvider);

    state = await AsyncValue.guard(() async {
      final requestBody = SignupRequestBody(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: confirmPassword,
      );

      final result = await repo.signup(requestBody);

      return result.when(
        success: (response) async {
          await _saveUserData(response);
          return response;
        },
        failure: (error) {
          throw error.apiErrorModel.message;
        },
      );
    });
  }

  /// Private method to handle user data persistence
  /// Separation: Encapsulates persistence logic
  Future<void> _saveUserData(SignupResponse response) async {
    await SharedPrefHelper.setSecuredString(
      SharedPrefKeys.userToken,
      response.token ?? '',
    );
    await SharedPrefHelper.saveEmail(response.email ?? '');
    await SharedPrefHelper.setData(
      SharedPrefKeys.userName,
      response.userName,
    );
  }
}

/// Provider for sign-up async operations
final signUpProvider =
    AsyncNotifierProvider<SignUpNotifier, SignupResponse?>(() {
  return SignUpNotifier();
});
