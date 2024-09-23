import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/features/auth/forget_password/data/repo/forget_password_repo.dart';
import 'package:tranquilo_app/features/auth/forget_password/data/model/forget_password_request_model.dart';
import 'package:tranquilo_app/features/auth/forget_password/logic/forget_password_cubit/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo _forgetPasswordRepo;

  ForgetPasswordCubit(this._forgetPasswordRepo)
      : super(const ForgetPasswordState.initial());

  void resetPassword(String email) async {
    emit(const ForgetPasswordState.loading());

    final response = await _forgetPasswordRepo.forgetPassword(
      ForgetPasswordRequestModel(email: email),
    );

    response.when(
      success: (data) {
        emit(ForgetPasswordState.success(data));
      },
      failure: (error) {
        emit(ForgetPasswordState.error(error: error.apiErrorModel));
      },
    );
  }
}
