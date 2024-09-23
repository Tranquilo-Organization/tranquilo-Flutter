import 'package:bloc/bloc.dart';
import 'dart:convert';
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
      success: (data) async {
        String jsonString = jsonEncode(data.toJson());
        await SharedPrefHelper.setData('surveyResult', jsonString);
        emit(SurveyState.success(data));
      },
      failure: (error) {
        emit(SurveyState.error(error: error.apiErrorModel));
      },
    );
  }

  Future<void> _saveSurveyResult(SurveyResponseModel data) async {
    String jsonString = jsonEncode(data.toJson());
    await SharedPrefHelper.setData('surveyResult', jsonString);
  }
}
