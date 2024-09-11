import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/tranquilo.dart';
import 'core/di/dependency_injection.dart';

void main() async {
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(
    const TranquiloApp(),
  );
}
