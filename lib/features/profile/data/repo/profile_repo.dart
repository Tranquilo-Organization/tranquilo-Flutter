import 'package:tranquilo_app/core/network/api_result.dart';
import 'package:tranquilo_app/core/network/api_service.dart';
import 'package:tranquilo_app/core/network/api_error_handler.dart';
import 'package:tranquilo_app/core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/features/profile/data/model/profile_response_model.dart';

class UserProfileRepo {
  final ApiService _apiService;

  UserProfileRepo(this._apiService);
  Future<ApiResult<ProfileResponseModel>> fetchUserProfile() async {
    try {
      String email = await SharedPrefHelper.getEmail();

      if (email.isNotEmpty) {
        final ProfileResponseModel profileResponseModel =
            await _apiService.fetchUserProfile(email);
        print('--------------------------------------\n repo success');
        return ApiResult.success(profileResponseModel);
      } else {
        print('--------------------------------------\n repo else error');
        return ApiResult.failure(
          ErrorHandler.handle(
            Exception("Email not found in shared preferences"),
          ),
        );
      }
    } catch (error) {
      print('--------------------------------------\n repo catch');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  Future<ApiResult<void>> deleteUserProfile() async {
    try {
      String email = await SharedPrefHelper.getEmail();

      if (email.isNotEmpty) {
        await _apiService.deleteUserProfile(email);
        return const ApiResult.success(null);
      } else {
        return ApiResult.failure(
          ErrorHandler.handle(
            Exception("Email not found in shared preferences"),
          ),
        );
      }
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}

