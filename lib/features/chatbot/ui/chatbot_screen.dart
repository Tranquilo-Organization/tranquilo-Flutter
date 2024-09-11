import 'package:flutter/material.dart';
import 'package:tranquilo_app/features/chatbot/ui/widgets/chatbot_screen_body.dart';

class ChatbotScreen extends StatelessWidget{
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatbotScreenBody(),
    );
  }
}