import 'package:json_annotation/json_annotation.dart';

part 'routine_response_model.g.dart';

@JsonSerializable()
class RoutineResponseModel {
  final List<Routine> model;
  final int statusCode;

  RoutineResponseModel({required this.model, required this.statusCode});

  factory RoutineResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RoutineResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$RoutineResponseModelToJson(this);
}

@JsonSerializable()
class Routine {
  final int id;
  final String name;
  final String description;

  // Changed to handle the case where steps might be a single string
  @_StepsConverter()
  final List<String> steps;

  final String type;
  final String levelName;

  Routine({
    required this.id,
    required this.name,
    required this.description,
    required this.steps,
    required this.type,
    required this.levelName,
  });

  factory Routine.fromJson(Map<String, dynamic> json) =>
      _$RoutineFromJson(json);
  Map<String, dynamic> toJson() => _$RoutineToJson(this);
}

class _StepsConverter implements JsonConverter<List<String>, dynamic> {
  const _StepsConverter();

  @override
  List<String> fromJson(dynamic json) {
    if (json is String) {
      // If it's a single string, split it by commas
      return json.split(',');
    } else if (json is List) {
      // If it's already a list, cast it to List<String>
      return List<String>.from(json);
    } else {
      // Fallback to an empty list if the format is unexpected
      return [];
    }
  }

  @override
  dynamic toJson(List<String> steps) {
    return steps; // Simply return the list
  }
}
