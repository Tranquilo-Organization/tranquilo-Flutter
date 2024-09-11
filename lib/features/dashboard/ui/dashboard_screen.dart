import 'package:flutter/material.dart';
import 'package:tranquilo_app/features/dashboard/ui/widgets/dashboard_screen_body.dart';

class DashboardScreen extends StatelessWidget{
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DashboardScreenBody(),
    );
  }
}