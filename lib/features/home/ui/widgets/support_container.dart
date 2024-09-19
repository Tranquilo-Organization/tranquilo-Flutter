import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportContainer extends StatelessWidget {
  final Widget containerContent;
  const SupportContainer({super.key, required this.containerContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffE2ECF7),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: containerContent,
    );
  }
}

