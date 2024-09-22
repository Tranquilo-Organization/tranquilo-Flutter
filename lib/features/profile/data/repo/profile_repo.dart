import 'package:tranquilo_app/core/network/api_result.dart';
import 'package:tranquilo_app/core/network/api_service.dart';
import 'package:tranquilo_app/core/network/api_error_handler.dart';
import 'package:tranquilo_app/core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/features/profile/data/model/profile_response_model.dart'; // Adjust import based on your project structure

class UserProfileRepo {
  final ApiService _apiService;

  UserProfileRepo(this._apiService);

  Future<ApiResult<ProfileResponseModel>> fetchUserProfile() async {
    try {
      String email = await SharedPrefHelper.getEmail();

      if (email.isNotEmpty) {
        // Step 2: Fetch the user profile using the API
        final ProfileResponseModel profileResponseModel =
            await _apiService.fetchUserProfile(email);

        // Step 3: Return the profile response on success
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
}
