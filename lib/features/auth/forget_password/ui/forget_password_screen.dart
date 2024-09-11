import 'package:flutter/material.dart';
import 'package:tranquilo_app/features/auth/forget_password/ui/widgets/forget_password_screen_body.dart';

class ForgetPasswordScreen extends StatelessWidget{
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ForgetPasswordScreenBody(),
    );
  }
}