import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/features/home/logic/routine_state.dart';
import 'package:tranquilo_app/features/home/data/repo/routine_repo.dart';

class RoutineCubit extends Cubit<RoutineState> {
  final RoutineRepo routineRepo;

  RoutineCubit(this.routineRepo) : super(const RoutineState.initial());

  /// Fetches routines based on the anxiety level stored in shared preferences.
  Future<void> fetchRoutines() async {
    emit(const RoutineState.loading());

    final result = await routineRepo.fetchRoutines();

    // Handle the result based on the new RoutineRepo logic
    result.when(
      success: (routines) => emit(RoutineState.success(routines)),
      failure: (error) {
        // Emit an error state with the provided error message
        emit(RoutineState.failure(error.apiErrorModel));
      },
    );
  }
}
