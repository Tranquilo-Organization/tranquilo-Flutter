import 'package:tranquilo_app/core/network/api_result.dart';
import 'package:tranquilo_app/core/network/api_service.dart';
import 'package:tranquilo_app/core/network/api_error_handler.dart';
import 'package:tranquilo_app/features/auth/reset_password/data/models/reset_password_request_model.dart';
import 'package:tranquilo_app/features/auth/reset_password/data/models/reset_password_response_model.dart';

class ResetPasswordRepo {
  final ApiService _apiService;

  ResetPasswordRepo(this._apiService);

  Future<ApiResult<ResetPasswordResponseModel>> resetPassword(
      ResetPasswordRequestModel requestModel) async {
    try {
      final response = await _apiService.resetPassword(requestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
