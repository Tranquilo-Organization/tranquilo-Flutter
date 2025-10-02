import 'dart:convert';
import 'package:tranquilo_app/core/di/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tranquilo_app/core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/features/survey/logic/models/survey_form_state.dart';
import 'package:tranquilo_app/features/survey/data/model/survey_request_model.dart';
import 'package:tranquilo_app/features/survey/data/model/survey_response_model.dart';
import 'package:tranquilo_app/features/survey/logic/providers/survey_form_provider.dart';

/// AsyncNotifier for handling survey submission
class SurveySubmissionNotifier extends AsyncNotifier<SurveyResponseModel?> {
  @override
  Future<SurveyResponseModel?> build() async {
    return null;
  }

  Future<void> submitSurvey() async {
    state = const AsyncValue.loading();

    final repo = ref.read(surveyRepoProvider);
    final formState = ref.read(surveyFormProvider);

    state = await AsyncValue.guard(() async {
      final requestModel = _buildRequestFromFormState(formState);
      final result = await repo.getClassificationResponse(requestModel);

      return result.when(
        success: (data) async {
          await _saveSurveyResult(data);
          await SharedPrefHelper.setSurveyCompleted(true);
          return data;
        },
        failure: (error) {
          throw error.apiErrorModel.message ?? 'Survey submission failed';
        },
      );
    });
  }

  SurveyRequestModel _buildRequestFromFormState(SurveyFormState formState) {
    return SurveyRequestModel(
      age: int.parse(formState.age!),
      gender: formState.gender!,
      bmi: double.parse(formState.bmi!),
      whoBmi: formState.whoBmi!,
      depressiveness: int.parse(formState.depressiveness!),
      depressionDiagnosis: formState.depressionDiagnosis == 'Yes' ? 1 : 0,
      depressionTreatment: formState.depressionTreatment == 'Yes' ? 1 : 0,
      anxiousness: int.parse(formState.anxiousness!),
      anxietyDiagnosis: formState.anxietyDiagnosis == 'Yes' ? 1 : 0,
      anxietyTreatment: formState.anxietyTreatment == 'Yes' ? 1 : 0,
      sleepiness: formState.sleepiness == 'Yes' ? 1 : 0,
    );
  }

  Future<void> _saveSurveyResult(SurveyResponseModel data) async {
    final jsonString = jsonEncode(data.toJson());
    await SharedPrefHelper.setData('surveyResult', jsonString);
  }
}

/// Provider for survey submission
final surveySubmissionProvider =
    AsyncNotifierProvider<SurveySubmissionNotifier, SurveyResponseModel?>(() {
  return SurveySubmissionNotifier();
});

/// Provider for loading saved survey result
final savedSurveyResultProvider =
    FutureProvider<SurveyResponseModel?>((ref) async {
  final resultJson = await SharedPrefHelper.getSurveyResult();

  if (resultJson != null && resultJson.isNotEmpty) {
    final jsonMap = jsonDecode(resultJson);
    return SurveyResponseModel.fromJson(jsonMap);
  }

  return null;
});
