import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';

class CustomErrorWidget extends StatelessWidget {
  final String error;
  const CustomErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 250,
            child: Lottie.asset(
                'assets/lotties/error_lottie.json'), 
          ),
          verticalSpace(20),
          Text(
            'Oops, something went wrong. Please try again',
            style: TextStyles.font12OceanBlueSemiBold.copyWith(
              color: ColorsManager.red,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
