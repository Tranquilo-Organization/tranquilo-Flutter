import 'package:tranquilo_app/core/network/api_result.dart';
import 'package:tranquilo_app/core/network/api_error_handler.dart';
import 'package:tranquilo_app/features/survey/data/model/survey_request_model.dart';
import 'package:tranquilo_app/features/survey/data/model/survey_response_model.dart';
import 'package:tranquilo_app/features/survey/data/api/classification_model_api_call.dart';

class SurveyRepo {
  final ClassificationModelApiService _classificationModelApiService;

  SurveyRepo(this._classificationModelApiService);

  Future<ApiResult<SurveyResponseModel>> getClassificationResponse(
      SurveyRequestModel requestModel) async {
    try {
      final response = await _classificationModelApiService
          .getClassificationResponse(requestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
