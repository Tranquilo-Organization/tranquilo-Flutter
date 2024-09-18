import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';

class SurveyStarting extends StatelessWidget {
  const SurveyStarting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text(
            'Let’s start GAD survey',
            style: TextStyles.font20JetBlackSemiBold,
          ),
          verticalSpace(30),
          SvgPicture.asset('assets/svgs/survey_start.svg')
        ],
      )),
    );
  }
}
