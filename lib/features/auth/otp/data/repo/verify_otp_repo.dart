import 'package:tranquilo_app/core/network/api_result.dart';
import 'package:tranquilo_app/core/network/api_service.dart';
import 'package:tranquilo_app/core/network/api_error_handler.dart';
import 'package:tranquilo_app/features/auth/otp/data/models/verify_otp_request_model.dart';
import 'package:tranquilo_app/features/auth/otp/data/models/verify_otp_response_model.dart';

class VerifyOtpRepo {
  final ApiService _apiService;

  VerifyOtpRepo(this._apiService);

  Future<ApiResult<VerifyOtpResponseModel>> verifyOtp(
      VerifyOtpRequestModel requestModel) async {
    try {
      final response = await _apiService.verifyOtp(requestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
