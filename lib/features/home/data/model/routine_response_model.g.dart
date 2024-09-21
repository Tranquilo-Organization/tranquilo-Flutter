// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Routine _$RoutineFromJson(Map<String, dynamic> json) => Routine(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      steps: (json['steps'] as List<dynamic>).map((e) => e as String).toList(),
      type: json['type'] as String,
      levelName: json['levelName'] as String,
    );

Map<String, dynamic> _$RoutineToJson(Routine instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'steps': instance.steps,
      'type': instance.type,
      'levelName': instance.levelName,
    };
