import 'package:bloc/bloc.dart';
import 'package:tranquilo_app/features/auth/otp/logic/verify_otp_state.dart';
import 'package:tranquilo_app/features/auth/otp/data/repo/verify_otp_repo.dart';
import 'package:tranquilo_app/features/auth/otp/data/models/verify_otp_request_model.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final VerifyOtpRepo _verifyOtpRepo;

  VerifyOtpCubit(this._verifyOtpRepo) : super(const VerifyOtpState.initial());

  Future<void> verifyOtp(VerifyOtpRequestModel requestModel) async {
    emit(const VerifyOtpState.loading());
    final result = await _verifyOtpRepo.verifyOtp(requestModel);

    result.when(
      success: (response) => emit(VerifyOtpState.success(response)),
      failure: (error) =>
          emit(VerifyOtpState.error(error: error.apiErrorModel)),
    );
  }
}
