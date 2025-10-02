import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/helpers/show_snack_bar.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';
import 'package:tranquilo_app/core/widgets/app_text_form_field.dart';
import 'package:tranquilo_app/features/survey/logic/providers/survey_api_provider.dart';
import 'package:tranquilo_app/features/survey/logic/providers/survey_form_provider.dart';

class SurveyPageViewBuilder extends ConsumerStatefulWidget {
  const SurveyPageViewBuilder({super.key});

  @override
  ConsumerState<SurveyPageViewBuilder> createState() =>
      _SurveyPageViewBuilderState();
}

class _SurveyPageViewBuilderState extends ConsumerState<SurveyPageViewBuilder> {
  final PageController _controller = PageController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _bmiController = TextEditingController();

  final List<Map<String, dynamic>> _surveyQuestions = [
    {
      'question': 'What is your age?',
      'type': 'input',
      'field': 'age',
    },
    {
      'question': 'What is your gender?',
      'type': 'mcq',
      'field': 'gender',
      'answers': ['Male', 'Female', 'Other'],
    },
    {
      'question': 'What is your BMI?',
      'type': 'input',
      'field': 'bmi',
      'hint':
          'You can calculate it by this way:\nweight in kilograms / square height in meters',
    },
    {
      'question': 'WHO BMI classification',
      'type': 'mcq',
      'field': 'whoBmi',
      'answers': [
        'Normal if BMI 18.5–25',
        'Overweight if BMI 25–30',
        'Underweight if BMI < 18.5',
        'Class I Obesity if BMI 30–35',
        'Class II Obesity if BMI 35–40',
        'Class III Obesity if BMI > 40'
      ],
    },
    {
      'question': 'How often do you feel depressed?',
      'type': 'mcq',
      'field': 'depressiveness',
      'answers': ['1', '2', '3', '4', '5'],
    },
    {
      'question': 'Have you ever been diagnosed with depression?',
      'type': 'mcq',
      'field': 'depressionDiagnosis',
      'answers': ['Yes', 'No'],
    },
    {
      'question': 'Are you currently receiving treatment for depression?',
      'type': 'mcq',
      'field': 'depressionTreatment',
      'answers': ['Yes', 'No'],
    },
    {
      'question': 'How often do you feel anxious?',
      'type': 'mcq',
      'field': 'anxiousness',
      'answers': ['1', '2', '3', '4', '5'],
    },
    {
      'question': 'Have you ever been diagnosed with anxiety?',
      'type': 'mcq',
      'field': 'anxietyDiagnosis',
      'answers': ['Yes', 'No'],
    },
    {
      'question': 'Are you currently receiving treatment for anxiety?',
      'type': 'mcq',
      'field': 'anxietyTreatment',
      'answers': ['Yes', 'No'],
    },
    {
      'question': 'Do you suffer from sleep problems?',
      'type': 'mcq',
      'field': 'sleepiness',
      'answers': ['Yes', 'No'],
    },
  ];

  @override
  void dispose() {
    _ageController.dispose();
    _bmiController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _updateFormState(String field, String value) {
    final notifier = ref.read(surveyFormProvider.notifier);
    switch (field) {
      case 'age':
        notifier.updateAge(value);
        break;
      case 'gender':
        notifier.updateGender(value);
        break;
      case 'bmi':
        notifier.updateBmi(value);
        break;
      case 'whoBmi':
        notifier.updateWhoBmi(value);
        break;
      case 'depressiveness':
        notifier.updateDepressiveness(value);
        break;
      case 'depressionDiagnosis':
        notifier.updateDepressionDiagnosis(value);
        break;
      case 'depressionTreatment':
        notifier.updateDepressionTreatment(value);
        break;
      case 'anxiousness':
        notifier.updateAnxiousness(value);
        break;
      case 'anxietyDiagnosis':
        notifier.updateAnxietyDiagnosis(value);
        break;
      case 'anxietyTreatment':
        notifier.updateAnxietyTreatment(value);
        break;
      case 'sleepiness':
        notifier.updateSleepiness(value);
        break;
    }
  }

  String? _getFieldValue(String field) {
    // FIX 1: Watch the entire form state to trigger rebuilds
    final formState = ref.watch(surveyFormProvider);
    switch (field) {
      case 'age':
        return formState.age;
      case 'gender':
        return formState.gender;
      case 'bmi':
        return formState.bmi;
      case 'whoBmi':
        return formState.whoBmi;
      case 'depressiveness':
        return formState.depressiveness;
      case 'depressionDiagnosis':
        return formState.depressionDiagnosis;
      case 'depressionTreatment':
        return formState.depressionTreatment;
      case 'anxiousness':
        return formState.anxiousness;
      case 'anxietyDiagnosis':
        return formState.anxietyDiagnosis;
      case 'anxietyTreatment':
        return formState.anxietyTreatment;
      case 'sleepiness':
        return formState.sleepiness;
      default:
        return null;
    }
  }

  void _nextPage() {
    final isValid = ref.read(isCurrentStepValidProvider);
    final currentStep = ref.read(surveyFormProvider).currentStep;

    if (!isValid) {
      showSnackBar(
        context,
        'Please complete this step before proceeding',
        ColorsManager.oceanBlue,
      );
      return;
    }

    if (currentStep < _surveyQuestions.length - 1) {
      ref.read(surveyFormProvider.notifier).nextStep();
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage() {
    final currentStep = ref.read(surveyFormProvider).currentStep;
    if (currentStep > 0) {
      ref.read(surveyFormProvider.notifier).previousStep();
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentStep =
        ref.watch(surveyFormProvider.select((s) => s.currentStep));

    // FIX 2: Watch submission state to show loading/error
    final submissionState = ref.watch(surveySubmissionProvider);

    // Listen to submission state for navigation
    ref.listen<AsyncValue>(
      surveySubmissionProvider,
      (previous, next) {
        next.when(
          data: (response) {
            if (response != null) {
              // Dismiss any loading dialog
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
              context.pushNamed(Routes.surveyCompleted);
            }
          },
          loading: () {
            // Show loading dialog
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          error: (error, stackTrace) {
            // Dismiss loading dialog
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
            showSnackBar(context, error.toString(), Colors.red);
          },
        );
      },
    );

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        itemCount: _surveyQuestions.length,
        itemBuilder: (context, index) {
          final question = _surveyQuestions[index];
          final questionType = question['type'];
          final field = question['field'];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              verticalSpace(40),
              Text(
                'Step ${index + 1} of ${_surveyQuestions.length}',
                style:
                    TextStyles.font20OceanBlueSemiBold.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              verticalSpace(32),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  question['question'],
                  style: TextStyles.font18JetBlackMedium,
                ),
              ),
              verticalSpace(16),

              // MCQ Type
              if (questionType == 'mcq') ...[
                ...question['answers'].map<Widget>((answer) {
                  final selectedValue = _getFieldValue(field);
                  return RadioListTile<String>(
                    fillColor: const WidgetStatePropertyAll<Color>(
                        ColorsManager.oceanBlue),
                    title: Text(
                      answer,
                      style: TextStyles.font14JetBlackMedium,
                    ),
                    visualDensity:
                        const VisualDensity(horizontal: -4, vertical: -4),
                    dense: true,
                    value: answer,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      if (value != null) {
                        _updateFormState(field, value);
                      }
                    },
                  );
                }).toList(),
                verticalSpace(24),
              ],

              // Input Type
              if (questionType == 'input') ...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: AppTextFormField(
                    controller:
                        field == 'age' ? _ageController : _bmiController,
                    hintText: 'Enter your answer',
                    keyboardType: TextInputType.number,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    onChanged: (value) {
                      _updateFormState(field, value);
                    },
                  ),
                ),
                verticalSpace(24),
              ],

              // Hint text for BMI
              if (question['hint'] != null) ...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    question['hint'],
                    style: TextStyles.font14JetBlackMedium
                        .copyWith(color: ColorsManager.lighterBlack),
                    textAlign: TextAlign.start,
                  ),
                ),
                verticalSpace(24),
              ],

              verticalSpace(30),

              // Navigation Buttons
              Row(
                children: [
                  if (currentStep > 0)
                    Expanded(
                      child: AppTextButton(
                        onPressed: _prevPage,
                        textButton: 'Back',
                        backgroundColor: ColorsManager.white,
                        textColor: ColorsManager.oceanBlue,
                        borderColor: ColorsManager.oceanBlue,
                      ),
                    ),
                  Expanded(
                    child: AppTextButton(
                      onPressed: submissionState.isLoading
                          ? null // Disable button while loading
                          : () {
                              if (index == _surveyQuestions.length - 1) {
                                final isValid =
                                    ref.read(isCurrentStepValidProvider);
                                if (!isValid) {
                                  showSnackBar(
                                    context,
                                    'Please complete this step before finishing',
                                    ColorsManager.oceanBlue,
                                  );
                                } else {
                                  // Submit survey
                                  ref
                                      .read(surveySubmissionProvider.notifier)
                                      .submitSurvey();
                                }
                              } else {
                                _nextPage();
                              }
                            },
                      textButton: index == _surveyQuestions.length - 1
                          ? (submissionState.isLoading
                              ? 'Submitting...'
                              : 'Finish')
                          : 'Next',
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
