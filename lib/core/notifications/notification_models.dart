import 'package:flutter/foundation.dart';

@immutable
class RoutineNotification {
  final String id;
  final String title;
  final String body;
  final DateTime scheduledTime;
  final String routineType; // 'morning', 'afternoon', 'night'

  const RoutineNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.scheduledTime,
    required this.routineType,
  });
}

class NotificationChannels {
  static const String routineReminder = 'routine_reminder';
  static const String routineCompletion = 'routine_completion';
}

class NotificationIds {
  static const int morningReminder = 1;
  static const int afternoonReminder = 2;
  static const int nightReminder = 3;
  static const int completionBase = 100;
}