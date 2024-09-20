import 'package:json_annotation/json_annotation.dart';

part 'survey_request_model.g.dart';

@JsonSerializable()
class SurveyRequestModel {
  final int age;
  final String gender;
  final double bmi;
  @JsonKey(name: 'who_bmi')
  final String whoBmi;
  final int depressiveness;
  @JsonKey(name: 'depression_diagnosis')
  final int depressionDiagnosis;
  @JsonKey(name: 'depression_treatment')
  final int depressionTreatment;
  final int anxiousness;
  @JsonKey(name: 'anxiety_diagnosis')
  final int anxietyDiagnosis;
  @JsonKey(name: 'anxiety_treatment')
  final int anxietyTreatment;
  final int sleepiness;

  SurveyRequestModel({
    required this.age,
    required this.gender,
    required this.bmi,
    required this.whoBmi,
    required this.depressiveness,
    required this.depressionDiagnosis,
    required this.depressionTreatment,
    required this.anxiousness,
    required this.anxietyDiagnosis,
    required this.anxietyTreatment,
    required this.sleepiness,
  });

  factory SurveyRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyRequestModelToJson(this);
}
