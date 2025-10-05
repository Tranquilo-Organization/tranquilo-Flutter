import 'notification_service.dart';
import 'package:flutter/material.dart';

class NotificationHelper {
  static final NotificationService _service = NotificationService();

  /// Initialize notifications on app start
  static Future<void> initialize() async {
    await _service.initialize();
  }

  /// Schedule default routine notifications
  static Future<void> setupRoutineNotifications() async {
    await _service.scheduleAllRoutines();
  }

  /// Update routine notification time
  static Future<void> updateRoutineTime({
    required String routineType,
    required TimeOfDay time,
  }) async {
    switch (routineType) {
      case 'morning':
        await _service.scheduleMorningRoutine(time: time);
        break;
      case 'afternoon':
        await _service.scheduleAfternoonRoutine(time: time);
        break;
      case 'night':
        await _service.scheduleNightRoutine(time: time);
        break;
    }
  }

  /// Show routine completion notification
  static Future<void> notifyRoutineCompletion(String routineType) async {
    await _service.showCompletionNotification(routineType: routineType);
  }

  /// Cancel all notifications
  static Future<void> cancelAll() async {
    await _service.cancelAllNotifications();
  }

  /// Check if notifications are scheduled
  static Future<bool> hasScheduledNotifications() async {
    final pending = await _service.getPendingNotifications();
    return pending.isNotEmpty;
  }
}