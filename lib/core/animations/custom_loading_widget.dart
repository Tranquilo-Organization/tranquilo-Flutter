import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';


class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Updated Lottie asset path
          SizedBox(
            height: 200, 
            child: Lottie.asset('assets/lotties/loading_lottie.json'), 
          ),
          const SizedBox(
            height: 20,
          ),
 
          const LinearProgressIndicator(
            color: ColorsManager.oceanBlue,
            backgroundColor: ColorsManager.lightGrey,
          ),
          const SizedBox(
            height: 120,
          ),
        ],
      ),
    );
  }
}
