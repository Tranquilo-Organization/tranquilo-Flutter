import '../../../../../core/network/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tranquilo_app/features/survey/data/model/survey_response_model.dart';

part 'survey_state.freezed.dart';

@freezed
class SurveyState<T> with _$SurveyState<T> {
  const factory SurveyState.initial() = _Initial;

  const factory SurveyState.loading() = Loading;

  const factory SurveyState.success(SurveyResponseModel data) = Success;

  const factory SurveyState.error({required ApiErrorModel error}) = Error;
}
