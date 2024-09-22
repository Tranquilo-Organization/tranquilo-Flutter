import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
// Ensure ColorsManager is imported

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          
          SizedBox(
            width: 250,
            child: Lottie.asset(
                'assets/lotties/error_lottie.json'), 
          ),
          const SizedBox(
            height: 20,
          ),
       
          Text(
            'Oops, something went wrong. Please try again',
            style: TextStyles.font12OceanBlueSemiBold.copyWith(
              color: ColorsManager.red, // Set the text color to red
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
