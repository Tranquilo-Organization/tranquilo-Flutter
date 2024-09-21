import 'dart:convert';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_button.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/features/survey/ui/widgets/list_tile_recommend.dart';
import 'package:tranquilo_app/features/survey/data/model/survey_response_model.dart';

class SurveyResult extends StatefulWidget {
  const SurveyResult({super.key});

  @override
  _SurveyResultState createState() => _SurveyResultState();
}

class _SurveyResultState extends State<SurveyResult> {
  String _anxietyLevel = 'unknown'; // Default anxiety level

  @override
  void initState() {
    super.initState();
    _loadSurveyResult();
  }

  Future<void> _loadSurveyResult() async {
    final resultJson = await SharedPrefHelper.getSurveyResult(); // Retrieve survey result
    debugPrint('Retrieved JSON string: $resultJson'); // Debugging line

    if (resultJson != null && resultJson.isNotEmpty) {
      // Convert the JSON string back to a Map
      final Map<String, dynamic> jsonMap = jsonDecode(resultJson);
      // Create a SurveyResponseModel from the JSON Map
      final surveyResult = SurveyResponseModel.fromJson(jsonMap);
      setState(() {
        _anxietyLevel = surveyResult.anxietyLevel;
      });
    } else {
      debugPrint('No survey result found in SharedPreferences');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(40),
              Text(
                'Survey Results',
                style: TextStyles.font20OceanBlueSemiBold,
              ),
              verticalSpace(5),
              SvgPicture.asset(
                'assets/svgs/survey_result.svg',
                width: 327.w,
                height: 327.h,
                fit: BoxFit.contain,
              ),
              verticalSpace(16),
              Text(
                'Your anxiety level is $_anxietyLevel, here\nare some recommendations:',
                style: TextStyles.font16JetBlackMedium,
              ),
              verticalSpace(12),
              const ListTileRecommend(
                icon: 'assets/svgs/routine.svg',
                text: 'Check your personalized routine to manage your anxiety level',
              ),
              const ListTileRecommend(
                icon: 'assets/svgs/community.svg',
                text: 'Join our community forum to connect with others',
              ),
              verticalSpace(20),
              AppTextButton(
                textButton: 'Continue to Dashboard',
                onPressed: () {
                  context.pushNamed(Routes.appLayout);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
