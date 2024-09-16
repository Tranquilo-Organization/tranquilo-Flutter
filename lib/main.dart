import 'package:flutter/material.dart';
import 'core/di/dependency_injection.dart';
import 'package:tranquilo_app/tranquilo.dart';
import 'package:tranquilo_app/core/routing/app_router.dart';


void main() async {
  setupGetIt();

  runApp(
    TranquiloApp(appRouter: AppRouter()),
  );
}
