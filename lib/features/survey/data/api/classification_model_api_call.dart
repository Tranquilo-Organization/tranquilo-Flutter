import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tranquilo_app/core/network/api_constants.dart';
import 'package:tranquilo_app/features/survey/data/model/survey_request_model.dart';
import 'package:tranquilo_app/features/survey/data/model/survey_response_model.dart';

part 'classification_model_api_call.g.dart';

@RestApi(baseUrl: ApiConstants.classificationModelUrl)
abstract class ClassificationModelApiService {
  factory ClassificationModelApiService(Dio dio, {String baseUrl}) =
      _ClassificationModelApiService;

  @POST(ApiConstants.predict)
  Future<SurveyResponseModel> getClassificationResponse(
    @Body() SurveyRequestModel classificationRequestModel,
  );
}
