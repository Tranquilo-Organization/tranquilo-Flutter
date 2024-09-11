import 'package:flutter/material.dart';
import 'package:tranquilo_app/features/auth/login/ui/widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginScreenBody(),
    );
  }
}