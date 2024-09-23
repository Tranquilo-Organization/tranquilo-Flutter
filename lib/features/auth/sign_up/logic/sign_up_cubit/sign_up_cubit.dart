import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:tranquilo_app/features/auth/sign_up/logic/sign_up_cubit/sign_up_state.dart';
import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';
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

    response.when(success: (signupResponse) async {
      await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, signupResponse.token ?? '');
      await SharedPrefHelper.saveEmail(signupResponse.email ?? '');
      await SharedPrefHelper.setData(SharedPrefKeys.userName,signupResponse.userName);
      emit(SignUpState.signupSuccess(signupResponse));
    }, failure: (error) {
      emit(SignUpState.signupError(error: error.apiErrorModel));
    });
  }
}

