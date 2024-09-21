import 'package:json_annotation/json_annotation.dart';

part 'survey_response_model.g.dart';

@JsonSerializable()
class SurveyResponseModel {
  @JsonKey(name: 'anxiety_level')
  final String anxietyLevel;
  @JsonKey(name: 'anxiety_level_id')
  final int anxietyLevelId;
  final int statusCode;

  SurveyResponseModel({
    required this.anxietyLevel,
    required this.anxietyLevelId,
    required this.statusCode,
  });

  factory SurveyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyResponseModelToJson(this);
}
