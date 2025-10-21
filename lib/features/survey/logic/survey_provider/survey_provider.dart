import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/features/survey/data/repo/survey_repo.dart';
import 'package:tranquilo_app/features/survey/data/model/survey_request_model.dart';
import 'package:tranquilo_app/features/survey/data/model/survey_response_model.dart';

enum SurveyStatus { initial, loading, success, error }

class SurveyProvider extends ChangeNotifier {
  final SurveyRepo _surveyRepo;

  SurveyProvider(this._surveyRepo);

  SurveyStatus _status = SurveyStatus.initial;
  String? _errorMessage;
  SurveyResponseModel? _surveyResponse;

  SurveyStatus get status => _status;
  String? get errorMessage => _errorMessage;
  SurveyResponseModel? get surveyResponse => _surveyResponse;

  bool get isLoading => _status == SurveyStatus.loading;
  bool get hasError => _status == SurveyStatus.error;
  bool get isSuccess => _status == SurveyStatus.success;

  Future<void> submitSurvey(SurveyRequestModel requestModel) async {
    _setStatus(SurveyStatus.loading);

    final result = await _surveyRepo.getClassificationResponse(requestModel);

    result.when(
      success: (data) async {
        await _saveSurveyResult(data);
        _surveyResponse = data;
        _setStatus(SurveyStatus.success);
      },
      failure: (error) {
        _errorMessage = error.apiErrorModel.message;
        _setStatus(SurveyStatus.error);
      },
    );
  }

  Future<void> _saveSurveyResult(SurveyResponseModel data) async {
    String jsonString = jsonEncode(data.toJson());
    await SharedPrefHelper.setData('surveyResult', jsonString);
  }

  Future<SurveyResponseModel?> loadSurveyResult() async {
    final resultJson = await SharedPrefHelper.getSurveyResult();
    if (resultJson != null && resultJson.isNotEmpty) {
      final Map<String, dynamic> jsonMap = jsonDecode(resultJson);
      _surveyResponse = SurveyResponseModel.fromJson(jsonMap);
      notifyListeners();
      return _surveyResponse;
    }
    return null;
  }

  void _setStatus(SurveyStatus status) {
    _status = status;
    notifyListeners();
  }

  void resetState() {
    _status = SurveyStatus.initial;
    _errorMessage = null;
    notifyListeners();
  }
}
