import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingLogo extends StatelessWidget {
  const OnBoardingLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Image.asset(
        'assets/images/logo.png',
        height: 30.h,
      ),
    );
  }
}
