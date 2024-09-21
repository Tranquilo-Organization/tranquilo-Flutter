import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tranquilo_app/core/network/api_error_model.dart';
import 'package:tranquilo_app/core/network/api_error_handler.dart';
import 'package:tranquilo_app/features/home/data/model/routine_response_model.dart';

part 'routine_state.freezed.dart';

@freezed
class RoutineState with _$RoutineState {
  const factory RoutineState.initial() = _Initial;
  const factory RoutineState.loading() = _Loading;
  const factory RoutineState.success(List<Routine> routines) = _Success;
  const factory RoutineState.failure(ApiErrorModel error) = _Failure;
}
