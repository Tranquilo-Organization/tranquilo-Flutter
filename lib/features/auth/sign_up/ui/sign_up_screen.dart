import 'package:flutter/material.dart';
import 'package:tranquilo_app/features/auth/sign_up/ui/widgets/sign_up_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpScreenBody(),
    );
  }
}
