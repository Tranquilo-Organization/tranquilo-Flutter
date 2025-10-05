import 'package:flutter_riverpod/legacy.dart';


/// State model for routine task completion
class RoutineTaskState {
  final bool isFirstTaskChecked;
  final bool isSecondTaskChecked;
  final bool isThirdTaskChecked;

  const RoutineTaskState({
    this.isFirstTaskChecked = false,
    this.isSecondTaskChecked = false,
    this.isThirdTaskChecked = false,
  });

  RoutineTaskState copyWith({
    bool? isFirstTaskChecked,
    bool? isSecondTaskChecked,
    bool? isThirdTaskChecked,
  }) {
    return RoutineTaskState(
      isFirstTaskChecked: isFirstTaskChecked ?? this.isFirstTaskChecked,
      isSecondTaskChecked: isSecondTaskChecked ?? this.isSecondTaskChecked,
      isThirdTaskChecked: isThirdTaskChecked ?? this.isThirdTaskChecked,
    );
  }

  bool get areAllTasksChecked =>
      isFirstTaskChecked && isSecondTaskChecked && isThirdTaskChecked;
}

/// StateNotifier for managing routine task completion
/// Why StateNotifierProvider: 
/// - Local UI state that changes (checkboxes)
/// - Needs to be reset when screen is disposed
/// - Similar to local StatefulWidget state but with Riverpod benefits
class RoutineTaskNotifier extends StateNotifier<RoutineTaskState> {
  RoutineTaskNotifier() : super(const RoutineTaskState());

  void toggleFirstTask(bool value) {
    state = state.copyWith(isFirstTaskChecked: value);
  }

  void toggleSecondTask(bool value) {
    state = state.copyWith(isSecondTaskChecked: value);
  }

  void toggleThirdTask(bool value) {
    state = state.copyWith(isThirdTaskChecked: value);
  }

  void reset() {
    state = const RoutineTaskState();
  }
}

/// Family provider to create separate task states for each routine type
/// Why Family: Creates separate instances for morning/afternoon/night
final routineTaskProvider = StateNotifierProvider.family<RoutineTaskNotifier, 
    RoutineTaskState, String>((ref, routineType) {
  return RoutineTaskNotifier();
});