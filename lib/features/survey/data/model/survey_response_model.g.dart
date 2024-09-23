// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyResponseModel _$SurveyResponseModelFromJson(Map<String, dynamic> json) =>
    SurveyResponseModel(
      anxietyLevel: json['anxiety_level'] as String,
      anxietyLevelId: (json['anxiety_level_id'] as num).toInt(),
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$SurveyResponseModelToJson(
        SurveyResponseModel instance) =>
    <String, dynamic>{
      'anxiety_level': instance.anxietyLevel,
      'anxiety_level_id': instance.anxietyLevelId,
      'statusCode': instance.statusCode,
    };
