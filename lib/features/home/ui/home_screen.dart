import 'package:flutter/material.dart';
import 'package:tranquilo_app/features/home/ui/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeScreenBody(),
    );
  }
}