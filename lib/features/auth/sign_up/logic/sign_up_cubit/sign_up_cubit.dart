import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:tranquilo_app/features/auth/sign_up/logic/sign_up_cubit/sign_up_state.dart';
import '../../data/model/sign_up_request_body.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignupRepo _signupRepo;

  SignUpCubit(this._signupRepo) : super(const SignUpState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(const SignUpState.signupLoading());

    final response = await _signupRepo.signup(
      SignupRequestBody(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: confirmPassword,
      ),
    );

    response.when(success: (signupResponse) {
      emit(SignUpState.signupSuccess(signupResponse));
    }, failure: (error) {
      emit(SignUpState.signupError(error: error.apiErrorModel));
    });
  }
}

