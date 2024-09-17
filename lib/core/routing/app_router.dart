import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import '../../features/auth/login/ui/login_screen.dart';
import 'package:tranquilo_app/features/onboarding/onboading_screen.dart';
import 'package:tranquilo_app/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:tranquilo_app/features/auth/forget_password/ui/forget_password_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),
        );
        case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => OnBoardingScreen(),
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
