import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/helpers/show_snack_bar.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/font_weight_helper.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';

import '../../../../core/helpers/shared_pref_helper.dart';

class SurveyPageViewBuilder extends StatefulWidget {
  const SurveyPageViewBuilder({super.key});

  @override
  State<SurveyPageViewBuilder> createState() => _SurveyPageViewBuilderState();
}

class _SurveyPageViewBuilderState extends State<SurveyPageViewBuilder> {

  int _currentStep = 0;
  final PageController _controller = PageController();

  /// static data until get API
  final List<Map<String, dynamic>> _surveyData = [
    {
      'question': 'What is your age?',
      'answers': ['Under 18', '18-25', '25-35', '35-45'],
      'selectedAnswer': null,
    },
    {
      'question': 'How often do you feel anxious?',
      'answers': ['Never', 'Sometimes', 'Often', 'Always'],
      'selectedAnswer': null,
    },
    {
      'question': 'Do you find it hard to relax?',
      'answers': ['Not at all', 'A little bit', 'Moderately', 'A lot'],
      'selectedAnswer': null,
    },
    {
      'question': 'Do you experience restlessness?',
      'answers': ['Never', 'Sometimes', 'Often', 'Always'],
      'selectedAnswer': null,
    },
    {
      'question': 'How often do you feel worried?',
      'answers': ['Rarely', 'Occasionally', 'Frequently', 'Constantly'],
      'selectedAnswer': null,
    },
  ];

  void _nextPage() {
    if (_surveyData[_currentStep]['selectedAnswer'] == null) {
      showSnackBar(
        context,
        'Please select an answer before proceeding',
        ColorsManager.oceanBlue,
      );
    } else if (_currentStep < _surveyData.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage() {
    if (_currentStep > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      onPageChanged: (index) {
        setState(() {
          _currentStep = index;
        });
      },
      itemCount: _surveyData.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            verticalSpace(40),
            Text(
              'Step ${index + 1} of ${_surveyData.length}',
              style: TextStyles.font20OceanBlueSemiBold.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            verticalSpace(32),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                _surveyData[index]['question'],
                style: TextStyles.font16JetBlackMedium.copyWith(
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
            ),
            verticalSpace(16),
            ..._surveyData[index]['answers'].map((answer) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: RadioListTile(
                  title: Text(
                    answer,
                    style: TextStyles.font16BlackRegular,
                  ),
                  dense: true,
                  value: answer,
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity(vertical: -2.h, horizontal: -4),
                  fillColor: WidgetStateProperty.all<Color>(ColorsManager.oceanBlue),
                  groupValue: _surveyData[index]['selectedAnswer'],
                  onChanged: (value) {
                    setState(() {
                      _surveyData[index]['selectedAnswer'] = value;
                    });
                  },
                ),
              );
            }).toList(),
            verticalSpace(48),
            Row(
              children: [
                if (_currentStep > 0)
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
                    onPressed: () async {
                      if (_currentStep == _surveyData.length - 1) {
                        if (_surveyData[_currentStep]['selectedAnswer'] ==
                            null) {
                          showSnackBar(
                            context,
                            'Please select an answer before finishing',
                            ColorsManager.oceanBlue,
                          );
                        } else {
                          await SharedPrefHelper.setSurveyCompleted(true);
                          context.pushNamedAndRemoveUntil(
                            Routes.surveyCompleted,
                            predicate: (Route<dynamic> route) => false,
                          );
                        }
                      } else {
                        _nextPage();
                      }
                    },
                    textButton: _currentStep == _surveyData.length - 1
                        ? 'Finish'
                        : 'Next',
                  ),
                ),
              ],
            ),
            verticalSpace(40),
          ],
        );
      },
    );
  }
}

