import 'package:bloc/bloc.dart';
import 'package:tranquilo_app/core/network/api_error_model.dart';
import 'package:tranquilo_app/features/survey/logic/survey_state.dart';
import 'package:tranquilo_app/features/survey/data/repo/survey_repo.dart';
import 'package:tranquilo_app/features/survey/data/model/survey_request_model.dart';
import 'package:tranquilo_app/features/survey/data/model/survey_response_model.dart';

class SurveyCubit extends Cubit<SurveyState> {
  final SurveyRepo _surveyRepo;

  SurveyCubit(this._surveyRepo) : super(const SurveyState.initial());

  // Method to submit the survey and get classification response
  Future<void> submitSurvey(SurveyRequestModel requestModel) async {
    // Set the state to loading when the survey is being processed
    emit(const SurveyState.loading());

    // Fetch the survey classification from the repository
    final result = await _surveyRepo.getClassificationResponse(requestModel);

    // Handle success or failure based on API result
    result.when(
      success: (data) {
        emit(SurveyState.success(data));
      },
      failure: (error) {
        emit(SurveyState.error(error: error.apiErrorModel));
      },
    );
  }
}
