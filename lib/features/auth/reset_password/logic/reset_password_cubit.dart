import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/features/auth/reset_password/logic/reset_password_state.dart';
import 'package:tranquilo_app/features/auth/reset_password/data/repo/reset_password_repo.dart';
import 'package:tranquilo_app/features/auth/reset_password/data/models/reset_password_request_model.dart';



class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordRepo _resetPasswordRepo;

  ResetPasswordCubit(this._resetPasswordRepo) : super(const ResetPasswordState.initial());

  Future<void> resetPassword(ResetPasswordRequestModel requestModel) async {
    emit(const ResetPasswordState.loading());
    final result = await _resetPasswordRepo.resetPassword(requestModel);

    result.when(
      success: (data) => emit(ResetPasswordState.success(data)),
      failure: (error) => emit(ResetPasswordState.error(error: error.apiErrorModel)),
    );
  }
}
