// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyRequestModel _$SurveyRequestModelFromJson(Map<String, dynamic> json) =>
    SurveyRequestModel(
      age: (json['age'] as num).toInt(),
      gender: json['gender'] as String,
      bmi: (json['bmi'] as num).toDouble(),
      whoBmi: json['who_bmi'] as String,
      depressiveness: (json['depressiveness'] as num).toInt(),
      depressionDiagnosis: (json['depression_diagnosis'] as num).toInt(),
      depressionTreatment: (json['depression_treatment'] as num).toInt(),
      anxiousness: (json['anxiousness'] as num).toInt(),
      anxietyDiagnosis: (json['anxiety_diagnosis'] as num).toInt(),
      anxietyTreatment: (json['anxiety_treatment'] as num).toInt(),
      sleepiness: (json['sleepiness'] as num).toInt(),
    );

Map<String, dynamic> _$SurveyRequestModelToJson(SurveyRequestModel instance) =>
    <String, dynamic>{
      'age': instance.age,
      'gender': instance.gender,
      'bmi': instance.bmi,
      'who_bmi': instance.whoBmi,
      'depressiveness': instance.depressiveness,
      'depression_diagnosis': instance.depressionDiagnosis,
      'depression_treatment': instance.depressionTreatment,
      'anxiousness': instance.anxiousness,
      'anxiety_diagnosis': instance.anxietyDiagnosis,
      'anxiety_treatment': instance.anxietyTreatment,
      'sleepiness': instance.sleepiness,
    };
