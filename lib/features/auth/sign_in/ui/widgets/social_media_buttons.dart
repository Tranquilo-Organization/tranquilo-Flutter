import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            // Handle Google login
          },
          icon: Image.asset(
            'assets/images/google.png',
            height: 40.h,
          ),
        ),
        IconButton(
          onPressed: () {
            // Handle Facebook login
          },
          icon: Image.asset(
            'assets/images/facebook.png',
            height: 40.h,
          ),
        ),
        IconButton(
          onPressed: () {
            // Handle Apple login
          },
          icon: Image.asset(
            'assets/images/apple.png',
            height: 40.h,
          ),
        ),
      ],
    );
  }
}
