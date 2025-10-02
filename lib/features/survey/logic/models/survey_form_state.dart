import 'package:flutter/foundation.dart';

@immutable
class SurveyFormState {
  final int currentStep;
  final String? age;
  final String? gender;
  final String? bmi;
  final String? whoBmi;
  final String? depressiveness;
  final String? depressionDiagnosis;
  final String? depressionTreatment;
  final String? anxiousness;
  final String? anxietyDiagnosis;
  final String? anxietyTreatment;
  final String? sleepiness;

  const SurveyFormState({
    this.currentStep = 0,
    this.age,
    this.gender,
    this.bmi,
    this.whoBmi,
    this.depressiveness,
    this.depressionDiagnosis,
    this.depressionTreatment,
    this.anxiousness,
    this.anxietyDiagnosis,
    this.anxietyTreatment,
    this.sleepiness,
  });

  SurveyFormState copyWith({
    int? currentStep,
    String? age,
    String? gender,
    String? bmi,
    String? whoBmi,
    String? depressiveness,
    String? depressionDiagnosis,
    String? depressionTreatment,
    String? anxiousness,
    String? anxietyDiagnosis,
    String? anxietyTreatment,
    String? sleepiness,
  }) {
    return SurveyFormState(
      currentStep: currentStep ?? this.currentStep,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      bmi: bmi ?? this.bmi,
      whoBmi: whoBmi ?? this.whoBmi,
      depressiveness: depressiveness ?? this.depressiveness,
      depressionDiagnosis: depressionDiagnosis ?? this.depressionDiagnosis,
      depressionTreatment: depressionTreatment ?? this.depressionTreatment,
      anxiousness: anxiousness ?? this.anxiousness,
      anxietyDiagnosis: anxietyDiagnosis ?? this.anxietyDiagnosis,
      anxietyTreatment: anxietyTreatment ?? this.anxietyTreatment,
      sleepiness: sleepiness ?? this.sleepiness,
    );
  }

  bool isStepValid(int step) {
    switch (step) {
      case 0:
        return age != null && age!.isNotEmpty;
      case 1:
        return gender != null;
      case 2:
        return bmi != null && bmi!.isNotEmpty;
      case 3:
        return whoBmi != null;
      case 4:
        return depressiveness != null;
      case 5:
        return depressionDiagnosis != null;
      case 6:
        return depressionTreatment != null;
      case 7:
        return anxiousness != null;
      case 8:
        return anxietyDiagnosis != null;
      case 9:
        return anxietyTreatment != null;
      case 10:
        return sleepiness != null;
      default:
        return false;
    }
  }

  bool get isComplete =>
      age != null &&
      gender != null &&
      bmi != null &&
      whoBmi != null &&
      depressiveness != null &&
      depressionDiagnosis != null &&
      depressionTreatment != null &&
      anxiousness != null &&
      anxietyDiagnosis != null &&
      anxietyTreatment != null &&
      sleepiness != null;
}
