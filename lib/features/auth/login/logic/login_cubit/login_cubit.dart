import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/features/auth/login/data/repo/login_repo.dart';
import 'package:tranquilo_app/features/auth/login/data/model/login_request_body.dart';
import 'package:tranquilo_app/features/auth/login/logic/login_cubit/login_state.dart';

import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates(String email, String password) async {
    emit(const LoginState.loading());

    final response = await _loginRepo.login(
      LoginRequestBody(
        email: email,
        password: password,
      ),
    );

    response.when(
      success: (loginResponse) async {
        await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, loginResponse.token);
        await SharedPrefHelper.saveEmail(loginResponse.email);
        await SharedPrefHelper.setData(SharedPrefKeys.userName,loginResponse.userName);
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel));
      },
    );
  }
}

