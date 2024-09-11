import 'package:flutter/material.dart';
import 'package:tranquilo_app/features/community/ui/widgets/community_screen_body.dart';

class CommunityScreen extends StatelessWidget{
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CommunityScreenBody(),
    );
  }
}