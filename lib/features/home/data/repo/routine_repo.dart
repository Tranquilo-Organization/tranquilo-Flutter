import 'package:tranquilo_app/core/network/api_result.dart';
import 'package:tranquilo_app/core/network/api_service.dart';
import 'package:tranquilo_app/core/network/api_error_handler.dart';
import 'package:tranquilo_app/core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/features/home/data/model/routine_response_model.dart';

class RoutineRepo {
  final ApiService _apiService;

  RoutineRepo(this._apiService);

  Future<ApiResult<List<Routine>>> fetchRoutines() async {
    try {
      int? levelId = await SharedPrefHelper.getAnxietyLevelId();
      if (levelId != null) {
        // Call the API service to get the response wrapped in RoutineResponseModel
        final response = await _apiService.fetchRoutinesByLevelId(levelId);

        // Log the raw response for debugging
        print('Fetched routines: ${response.toString()}');

        // Return the success result
        return ApiResult.success(
            response); // Assuming response is already List<Routine>
      } else {
        return ApiResult.failure(
          ErrorHandler.handle(
              Exception("Anxiety level ID not found in shared preferences")),
        );
      }
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
