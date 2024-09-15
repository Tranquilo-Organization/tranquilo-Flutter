import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:tranquilo_app/features/auth/sign_in/ui/sign_in.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
      // return MaterialPageRoute(
      //   builder: (_) => const OnboardingScreen(),
      // );
      case Routes.signIn:
        return MaterialPageRoute(
          builder: (_) => const SignIn(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
