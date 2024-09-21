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
