import 'package:flutter/material.dart';
import 'package:tranquilo_app/features/survey/data/model/survey_request_model.dart';

class SurveyFormProvider extends ChangeNotifier {
  int _currentStep = 0;
  final PageController pageController = PageController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController bmiController = TextEditingController();

  final List<Map<String, dynamic>> _surveyData = [
    {
      'question': 'What is your age?',
      'type': 'input',
      'key': 'age',
    },
    {
      'question': 'What is your gender?',
      'type': 'mcq',
      'key': 'gender',
      'answers': ['Male', 'Female', 'Other'],
      'selectedAnswer': null,
    },
    {
      'question': 'What is your BMI?',
      'type': 'input',
      'key': 'bmi',
    },
    {
      'question': 'WHO BMI classification',
      'type': 'mcq',
      'key': 'whoBmi',
      'answers': [
        'Normal if BMI 18.5–25',
        'Overweight if BMI 25–30',
        'Underweight if BMI < 18.5',
        'Class I Obesity if BMI 30–35',
        'Class II Obesity if BMI 35–40',
        'Class III Obesity if BMI > 40'
      ],
      'selectedAnswer': null,
    },
    {
      'question': 'How often do you feel depressed?',
      'type': 'mcq',
      'key': 'depressiveness',
      'answers': ['1', '2', '3', '4', '5'],
      'selectedAnswer': null,
    },
    {
      'question': 'Have you ever been diagnosed with depression?',
      'type': 'mcq',
      'key': 'depressionDiagnosis',
      'answers': ['Yes', 'No'],
      'selectedAnswer': null,
    },
    {
      'question': 'Are you currently receiving treatment for depression?',
      'type': 'mcq',
      'key': 'depressionTreatment',
      'answers': ['Yes', 'No'],
      'selectedAnswer': null,
    },
    {
      'question': 'How often do you feel anxious?',
      'type': 'mcq',
      'key': 'anxiousness',
      'answers': ['1', '2', '3', '4', '5'],
      'selectedAnswer': null,
    },
    {
      'question': 'Have you ever been diagnosed with anxiety?',
      'type': 'mcq',
      'key': 'anxietyDiagnosis',
      'answers': ['Yes', 'No'],
      'selectedAnswer': null,
    },
    {
      'question': 'Are you currently receiving treatment for anxiety?',
      'type': 'mcq',
      'key': 'anxietyTreatment',
      'answers': ['Yes', 'No'],
      'selectedAnswer': null,
    },
    {
      'question': 'Do you suffer from sleep problems?',
      'type': 'mcq',
      'key': 'sleepiness',
      'answers': ['Yes', 'No'],
      'selectedAnswer': null,
    },
  ];

  int get currentStep => _currentStep;
  int get totalSteps => _surveyData.length;
  List<Map<String, dynamic>> get surveyData => _surveyData;

  bool get isFirstStep => _currentStep == 0;
  bool get isLastStep => _currentStep == _surveyData.length - 1;

  String? getSelectedAnswer(int index) {
    return _surveyData[index]['selectedAnswer'];
  }

  void updateCurrentStep(int step) {
    _currentStep = step;
    notifyListeners();
  }

  void setAnswer(int index, String? answer) {
    _surveyData[index]['selectedAnswer'] = answer;
    notifyListeners();
  }

  bool isCurrentStepValid() {
    final currentQuestion = _surveyData[_currentStep];
    final questionType = currentQuestion['type'];

    if (questionType == 'mcq') {
      return currentQuestion['selectedAnswer'] != null;
    } else if (questionType == 'input') {
      final key = currentQuestion['key'];
      if (key == 'age') {
        return ageController.text.isNotEmpty;
      } else if (key == 'bmi') {
        return bmiController.text.isNotEmpty;
      }
    }
    return false;
  }

  void nextPage() {
    if (_currentStep < _surveyData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (_currentStep > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  SurveyRequestModel buildSurveyRequest() {
    return SurveyRequestModel(
      age: int.parse(ageController.text),
      gender: _surveyData[1]['selectedAnswer'],
      bmi: double.parse(bmiController.text),
      whoBmi: _surveyData[3]['selectedAnswer'],
      depressiveness: int.parse(_surveyData[4]['selectedAnswer']),
      depressionDiagnosis: _surveyData[5]['selectedAnswer'] == 'Yes' ? 1 : 0,
      depressionTreatment: _surveyData[6]['selectedAnswer'] == 'Yes' ? 1 : 0,
      anxiousness: int.parse(_surveyData[7]['selectedAnswer']),
      anxietyDiagnosis: _surveyData[8]['selectedAnswer'] == 'Yes' ? 1 : 0,
      anxietyTreatment: _surveyData[9]['selectedAnswer'] == 'Yes' ? 1 : 0,
      sleepiness: _surveyData[10]['selectedAnswer'] == 'Yes' ? 1 : 0,
    );
  }

  void reset() {
    _currentStep = 0;
    ageController.clear();
    bmiController.clear();

    for (var question in _surveyData) {
      if (question['type'] == 'mcq') {
        question['selectedAnswer'] = null;
      }
    }

    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    ageController.dispose();
    bmiController.dispose();
    super.dispose();
  }
}
