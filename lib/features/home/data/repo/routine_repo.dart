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
        // Fetch the response
        final RoutineResponseModel routineResponseModel =
            await _apiService.fetchRoutinesByLevelId(levelId);

        // Extract the list of routines from the 'model' field
        final List<Routine> routines = routineResponseModel.model;

        // Return the list of routines on success
        return ApiResult.success(routines);
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
