import 'core/routing/routes.dart';
import 'core/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'core/di/dependency_injection.dart';
import 'package:tranquilo_app/tranquilo.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();

  bool isFirstLaunch = await SharedPrefHelper.isFirstLaunch();
  bool isLoggedIn = isFirstLaunch ? false : await checkIfLoggedInUser();
  bool isSurveyCompleted = isLoggedIn ? await SharedPrefHelper.isSurveyCompleted() : false;

  runApp(
    TranquiloApp(
      appRouter: AppRouter(),
       initialRoute: Routes.appLayout
      //  isFirstLaunch
      //     ? Routes.onBoardingScreen
      //     : (isLoggedIn
      //     ? (isSurveyCompleted ? Routes.appLayout : Routes.surveyStarting)
      //     : Routes.loginScreen),
    ),
  );
}

Future<bool> checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  return userToken != null && userToken.isNotEmpty;
}


