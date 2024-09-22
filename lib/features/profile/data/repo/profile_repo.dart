import 'package:tranquilo_app/core/network/api_result.dart';
import 'package:tranquilo_app/core/network/api_service.dart';
import 'package:tranquilo_app/core/network/api_error_handler.dart';
import 'package:tranquilo_app/core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/features/profile/data/model/profile_response_model.dart'; // Adjust import based on your project structure

class UserProfileRepo {
  final ApiService _apiService;

  UserProfileRepo(this._apiService);

  // Fetch User Profile
  Future<ApiResult<ProfileResponseModel>> fetchUserProfile() async {
    try {
      String email = await SharedPrefHelper.getEmail();

      if (email.isNotEmpty) {
        final ProfileResponseModel profileResponseModel =
            await _apiService.fetchUserProfile(email);

        // Return the profile response on success
        return ApiResult.success(profileResponseModel);
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

  // Delete User Profile (no response expected)
  Future<ApiResult<void>> deleteUserProfile() async {
    try {
      // Retrieve the email from shared preferences
      String email = await SharedPrefHelper.getEmail();

      if (email.isNotEmpty) {
        // Call the delete user profile API, the response is empty
        await _apiService.deleteUserProfile(email);

        // Return success with no data
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
