import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/helpers/show_snack_bar.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';
import 'package:tranquilo_app/core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/core/widgets/app_text_form_field.dart';
import 'package:tranquilo_app/features/survey/logic/survey_provider/survey_provider.dart';
import 'package:tranquilo_app/features/survey/logic/survey_form_provider/survey_form_provider.dart';

class SurveyPageViewBuilder extends StatefulWidget {
  const SurveyPageViewBuilder({super.key});

  @override
  State<SurveyPageViewBuilder> createState() => _SurveyPageViewBuilderState();
}

class _SurveyPageViewBuilderState extends State<SurveyPageViewBuilder> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SurveyProvider>().resetState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<SurveyFormProvider, SurveyProvider>(
      builder: (context, formProvider, surveyProvider, child) {
        _handleSurveyStateChanges(context, surveyProvider);

        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: formProvider.pageController,
            onPageChanged: (index) {
              formProvider.updateCurrentStep(index);
            },
            itemCount: formProvider.totalSteps,
            itemBuilder: (context, index) {
              return _buildSurveyPage(
                  context, formProvider, surveyProvider, index);
            },
          ),
        );
      },
    );
  }

  Widget _buildSurveyPage(
    BuildContext context,
    SurveyFormProvider formProvider,
    SurveyProvider surveyProvider,
    int index,
  ) {
    final questionData = formProvider.surveyData[index];
    final questionType = questionData['type'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        verticalSpace(40),
        Text(
          'Step ${index + 1} of ${formProvider.totalSteps}',
          style: TextStyles.font20OceanBlueSemiBold.copyWith(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        verticalSpace(32),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            questionData['question'],
            style: TextStyles.font18JetBlackMedium,
          ),
        ),
        verticalSpace(16),
        if (questionType == 'mcq') ...[
          ..._buildMultipleChoiceOptions(formProvider, questionData, index),
          verticalSpace(24),
        ],
        if (questionType == 'input') ...[
          _buildInputField(formProvider, questionData),
          verticalSpace(48),
        ],
        if (index == 2) _buildBmiHint(),
        verticalSpace(30),
        _buildNavigationButtons(context, formProvider, surveyProvider),
      ],
    );
  }

  List<Widget> _buildMultipleChoiceOptions(
    SurveyFormProvider formProvider,
    Map<String, dynamic> questionData,
    int index,
  ) {
    return questionData['answers'].map<Widget>((answer) {
      return RadioListTile(
        fillColor: const WidgetStatePropertyAll<Color>(ColorsManager.oceanBlue),
        title: Text(answer, style: TextStyles.font14JetBlackMedium),
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        dense: true,
        value: answer,
        groupValue: formProvider.getSelectedAnswer(index),
        onChanged: (value) {
          formProvider.setAnswer(index, value);
        },
      );
    }).toList();
  }

  Widget _buildInputField(
    SurveyFormProvider formProvider,
    Map<String, dynamic> questionData,
  ) {
    final key = questionData['key'];
    final controller =
        key == 'age' ? formProvider.ageController : formProvider.bmiController;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: AppTextFormField(
        controller: controller,
        hintText: 'Enter your answer',
        keyboardType: TextInputType.number,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      ),
    );
  }

  Widget _buildBmiHint() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        'You can calculate it by this way:\nweight in kilograms / square height in meters',
        style: TextStyles.font14JetBlackMedium
            .copyWith(color: ColorsManager.lighterBlack),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _buildNavigationButtons(
    BuildContext context,
    SurveyFormProvider formProvider,
    SurveyProvider surveyProvider,
  ) {
    return Row(
      children: [
        if (!formProvider.isFirstStep)
          Expanded(
            child: AppTextButton(
              onPressed: formProvider.previousPage,
              textButton: 'Back',
              backgroundColor: ColorsManager.white,
              textColor: ColorsManager.oceanBlue,
              borderColor: ColorsManager.oceanBlue,
            ),
          ),
        Expanded(
          child: AppTextButton(
            onPressed: surveyProvider.isLoading
                ? null
                : () =>
                    _handleNextOrFinish(context, formProvider, surveyProvider),
            textButton: formProvider.isLastStep ? 'Finish' : 'Next',
          ),
        ),
      ],
    );
  }

  void _handleNextOrFinish(
    BuildContext context,
    SurveyFormProvider formProvider,
    SurveyProvider surveyProvider,
  ) {
    if (!formProvider.isCurrentStepValid()) {
      final questionType =
          formProvider.surveyData[formProvider.currentStep]['type'];
      final message = questionType == 'mcq'
          ? 'Please select an answer before proceeding'
          : 'Please fill in the required field';

      showSnackBar(context, message, ColorsManager.oceanBlue);
      return;
    }

    if (formProvider.isLastStep) {
      _submitSurvey(context, formProvider, surveyProvider);
    } else {
      formProvider.nextPage();
    }
  }

  Future<void> _submitSurvey(
    BuildContext context,
    SurveyFormProvider formProvider,
    SurveyProvider surveyProvider,
  ) async {
    final request = formProvider.buildSurveyRequest();
    await surveyProvider.submitSurvey(request);
    await SharedPrefHelper.setSurveyCompleted(true);
  }

  void _handleSurveyStateChanges(
      BuildContext context, SurveyProvider provider) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (provider.status == SurveyStatus.success) {
        context.pushNamed(Routes.surveyCompleted);
        provider.resetState();
      } else if (provider.status == SurveyStatus.error) {
        showSnackBar(
            context, provider.errorMessage ?? 'An error occurred', Colors.red);
        provider.resetState();
      }
    });
  }
}
