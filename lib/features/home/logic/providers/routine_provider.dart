import 'package:tranquilo_app/core/di/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tranquilo_app/features/home/data/model/routine_response_model.dart';

/// FutureProvider for fetching routines
/// Why FutureProvider instead of AsyncNotifierProvider:
/// - One-time data fetch on screen load
/// - Data doesn't change frequently
/// - Simple read-only operation
/// - Auto-caching built-in
final routineProvider = FutureProvider<List<Routine>>((ref) async {
  final repo = ref.watch(routineRepoProvider);
  final result = await repo.fetchRoutines();

  return result.when(
    success: (routines) => routines,
    failure: (error) => throw error.apiErrorModel.message ?? 'Failed to fetch routines',
  );
});

/// Provider for filtering specific routine by type
/// Why Provider with select: Computed/derived state, no mutations needed
final morningRoutineProvider = Provider<Routine?>((ref) {
  final routinesAsync = ref.watch(routineProvider);
  
  return routinesAsync.when(
    data: (routines) {
      try {
        return routines.firstWhere((routine) => routine.type == 'Morning');
      } catch (e) {
        return null;
      }
    },
    loading: () => null,
    error: (_, __) => null,
  );
});

final afternoonRoutineProvider = Provider<Routine?>((ref) {
  final routinesAsync = ref.watch(routineProvider);
  
  return routinesAsync.when(
    data: (routines) {
      try {
        return routines.firstWhere((routine) => routine.type == 'Day');
      } catch (e) {
        return null;
      }
    },
    loading: () => null,
    error: (_, __) => null,
  );
});

final nightRoutineProvider = Provider<Routine?>((ref) {
  final routinesAsync = ref.watch(routineProvider);
  
  return routinesAsync.when(
    data: (routines) {
      try {
        return routines.firstWhere((routine) => routine.type == 'Night');
      } catch (e) {
        return null;
      }
    },
    loading: () => null,
    error: (_, __) => null,
  );
});