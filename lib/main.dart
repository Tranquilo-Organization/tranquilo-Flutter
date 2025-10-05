import 'core/routing/routes.dart';
import 'core/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/tranquilo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/notifications/notification_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tranquilo_app/core/routing/app_router.dart';
import 'package:tranquilo_app/core/helpers/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // Initialize notifications
  try {
    await NotificationHelper.initialize();
  } catch (e) {
    debugPrint('Failed to initialize notifications: $e');
  }
  Bloc.observer = SimpleBlocObserver();

  bool isFirstLaunch = await SharedPrefHelper.isFirstLaunch();
  bool isLoggedIn = isFirstLaunch ? false : await checkIfLoggedInUser();
  bool isSurveyCompleted =
      isLoggedIn ? await SharedPrefHelper.isSurveyCompleted() : false;

  if (isLoggedIn) {
    await NotificationHelper.setupRoutineNotifications();
  }

  runApp(
    ProviderScope(
      child: TranquiloApp(
        appRouter: AppRouter(),
        initialRoute: isFirstLaunch
            ? Routes.onBoardingScreen
            : (isLoggedIn
                ? (isSurveyCompleted ? Routes.appLayout : Routes.surveyStarting)
                : Routes.loginScreen),
      ),
    ),
  );
}

Future<bool> checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  return userToken != null && userToken.isNotEmpty;
}
