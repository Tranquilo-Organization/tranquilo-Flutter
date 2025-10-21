import 'package:flutter/material.dart';
import '../../../../../core/helpers/constants.dart';
import 'package:tranquilo_app/core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:tranquilo_app/features/auth/sign_up/data/model/sign_up_request_body.dart';

enum SignUpStatus { initial, loading, success, error }

class SignUpProvider extends ChangeNotifier {
  final SignupRepo _signupRepo;

  SignUpProvider(this._signupRepo);

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SignUpStatus _status = SignUpStatus.initial;
  String? _errorMessage;
  dynamic _signupResponse;

  SignUpStatus get status => _status;
  String? get errorMessage => _errorMessage;
  dynamic get signupResponse => _signupResponse;

  bool get isLoading => _status == SignUpStatus.loading;

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    _setStatus(SignUpStatus.loading);

    final response = await _signupRepo.signup(
      SignupRequestBody(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: confirmPassword,
      ),
    );

    response.when(
      success: (signupResponse) async {
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.userToken,
          signupResponse.token ?? '',
        );
        await SharedPrefHelper.saveEmail(signupResponse.email ?? '');
        await SharedPrefHelper.setData(
          SharedPrefKeys.userName,
          signupResponse.userName,
        );

        _signupResponse = signupResponse;
        _setStatus(SignUpStatus.success);
      },
      failure: (error) {
        _errorMessage = error.apiErrorModel.message;
        _setStatus(SignUpStatus.error);
      },
    );
  }

  void _setStatus(SignUpStatus status) {
    _status = status;
    notifyListeners();
  }

  void resetState() {
    _status = SignUpStatus.initial;
    _errorMessage = null;
    _signupResponse = null;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
