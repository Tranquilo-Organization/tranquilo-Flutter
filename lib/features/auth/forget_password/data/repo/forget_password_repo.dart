import 'package:tranquilo_app/core/network/api_result.dart';
import 'package:tranquilo_app/core/network/api_service.dart';
import 'package:tranquilo_app/core/network/api_error_handler.dart';
import 'package:tranquilo_app/features/auth/forget_password/data/model/forget_password_request_model.dart';
import 'package:tranquilo_app/features/auth/forget_password/data/model/forget_password_response_model.dart';

class ForgetPasswordRepo {
  final ApiService _apiService;

  ForgetPasswordRepo(this._apiService);

  Future<ApiResult<ForgetPasswordResponseModel>> forgetPassword(
      ForgetPasswordRequestModel requestModel) async {
    try {
      final response = await _apiService.forgetPassword(requestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
