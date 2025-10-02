import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tranquilo_app/features/survey/logic/models/survey_form_state.dart';

/// StateNotifier for managing survey form state
class SurveyFormNotifier extends StateNotifier<SurveyFormState> {
  SurveyFormNotifier() : super(const SurveyFormState());

  void updateCurrentStep(int step) {
    state = state.copyWith(currentStep: step);
  }

  void updateAge(String age) {
    state = state.copyWith(age: age);
  }

  void updateGender(String gender) {
    state = state.copyWith(gender: gender);
  }

  void updateBmi(String bmi) {
    state = state.copyWith(bmi: bmi);
  }

  void updateWhoBmi(String whoBmi) {
    state = state.copyWith(whoBmi: whoBmi);
  }

  void updateDepressiveness(String depressiveness) {
    state = state.copyWith(depressiveness: depressiveness);
  }

  void updateDepressionDiagnosis(String diagnosis) {
    state = state.copyWith(depressionDiagnosis: diagnosis);
  }

  void updateDepressionTreatment(String treatment) {
    state = state.copyWith(depressionTreatment: treatment);
  }

  void updateAnxiousness(String anxiousness) {
    state = state.copyWith(anxiousness: anxiousness);
  }

  void updateAnxietyDiagnosis(String diagnosis) {
    state = state.copyWith(anxietyDiagnosis: diagnosis);
  }

  void updateAnxietyTreatment(String treatment) {
    state = state.copyWith(anxietyTreatment: treatment);
  }

  void updateSleepiness(String sleepiness) {
    state = state.copyWith(sleepiness: sleepiness);
  }

  void nextStep() {
    if (state.isStepValid(state.currentStep)) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  void reset() {
    state = const SurveyFormState();
  }
}

/// Provider for survey form state management
final surveyFormProvider =
    StateNotifierProvider<SurveyFormNotifier, SurveyFormState>((ref) {
  return SurveyFormNotifier();
});

/// Computed provider for current step validation
final isCurrentStepValidProvider = Provider<bool>((ref) {
  final formState = ref.watch(surveyFormProvider);
  return formState.isStepValid(formState.currentStep);
});

/// Computed provider for form completion status
final isSurveyCompleteProvider = Provider<bool>((ref) {
  final formState = ref.watch(surveyFormProvider);
  return formState.isComplete;
});
