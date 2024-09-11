import 'package:flutter/material.dart';
import 'package:tranquilo_app/features/survey/ui/widgets/survey_screen_body.dart';

class SurveyScreen extends StatelessWidget{
  const SurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SurveyScreenBody(),
    );
  }
}