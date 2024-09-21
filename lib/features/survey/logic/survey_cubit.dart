import 'package:bloc/bloc.dart';
import 'package:tranquilo_app/core/network/api_error_model.dart';
import 'package:tranquilo_app/core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/features/survey/logic/survey_state.dart';
import 'package:tranquilo_app/features/survey/data/repo/survey_repo.dart';
import 'package:tranquilo_app/features/survey/data/model/survey_request_model.dart';
import 'package:tranquilo_app/features/survey/data/model/survey_response_model.dart';

class SurveyCubit extends Cubit<SurveyState> {
  final SurveyRepo _surveyRepo;

  SurveyCubit(this._surveyRepo) : super(const SurveyState.initial());

  Future<void> submitSurvey(SurveyRequestModel requestModel) async {
    emit(const SurveyState.loading());

    final result = await _surveyRepo.getClassificationResponse(requestModel);

    result.when(
      success: (data) {
        // Save the result to SharedPreferences as a JSON string
        SharedPrefHelper.setData('surveyResult', data.toJson());
        emit(SurveyState.success(data));
      },
      failure: (error) {
        emit(SurveyState.error(error: error.apiErrorModel));
      },
    );
  }

  // Method to save survey result to SharedPreferences
  Future<void> _saveSurveyResult(SurveyResponseModel data) async {
    await SharedPrefHelper.setData('surveyResult', data.toJson());
  }
}
