import 'dart:io';
import 'notification_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  /// Initialize notification service
  Future<void> initialize() async {
    if (_isInitialized) return;

    // Initialize timezone
    tz.initializeTimeZones();

    // Android initialization settings
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS initialization settings
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Create notification channels for Android
    await _createNotificationChannels();

    // Request permissions
    await _requestPermissions();

    _isInitialized = true;
  }

  /// Create notification channels (Android)
  Future<void> _createNotificationChannels() async {
    const reminderChannel = AndroidNotificationChannel(
      NotificationChannels.routineReminder,
      'Routine Reminders',
      description: 'Notifications for routine reminders',
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
    );

    const completionChannel = AndroidNotificationChannel(
      NotificationChannels.routineCompletion,
      'Routine Completion',
      description: 'Notifications when you complete routines',
      importance: Importance.defaultImportance,
      playSound: true,
    );

    await _notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(reminderChannel);

    await _notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(completionChannel);
  }

  /// Request notification permissions
  Future<bool> _requestPermissions() async {
    // Request notification permission
    if (await Permission.notification.isDenied) {
      final notificationStatus = await Permission.notification.request();
      if (!notificationStatus.isGranted) {
        return false;
      }
    }

    // Request exact alarm permission for Android 12+ (API 31+)
    if (Platform.isAndroid) {
      try {
        if (await Permission.scheduleExactAlarm.isDenied) {
          final exactAlarmStatus =
              await Permission.scheduleExactAlarm.request();
          if (!exactAlarmStatus.isGranted) {
            debugPrint('Exact alarm permission not granted');
            return false;
          }
        }
      } catch (e) {
        debugPrint('Error requesting exact alarm permission: $e');
      }
    }

    return true;
  }

  /// Handle notification tap
  void _onNotificationTapped(NotificationResponse response) {
    final payload = response.payload;
    if (payload != null) {
      debugPrint('Notification tapped with payload: $payload');
    }
  }

  /// Schedule morning routine notification
  Future<void> scheduleMorningRoutine({
    required TimeOfDay time,
  }) async {
    final now = DateTime.now();
    var scheduledDate = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await _scheduleNotification(
      id: NotificationIds.morningReminder,
      title: 'Morning Routine',
      body:
          'Time to start your morning routine! Begin with grounding exercises.',
      scheduledTime: scheduledDate,
      payload: 'morning_routine',
      channelId: NotificationChannels.routineReminder,
    );
  }

  /// Schedule afternoon routine notification
  Future<void> scheduleAfternoonRoutine({
    required TimeOfDay time,
  }) async {
    final now = DateTime.now();
    var scheduledDate = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await _scheduleNotification(
      id: NotificationIds.afternoonReminder,
      title: 'Afternoon Routine',
      body:
          'Time for your afternoon routine! Take a moment to breathe and reset.',
      scheduledTime: scheduledDate,
      payload: 'afternoon_routine',
      channelId: NotificationChannels.routineReminder,
    );
  }

  /// Schedule night routine notification
  Future<void> scheduleNightRoutine({
    required TimeOfDay time,
  }) async {
    final now = DateTime.now();
    var scheduledDate = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await _scheduleNotification(
      id: NotificationIds.nightReminder,
      title: 'Night Routine',
      body:
          'Time to wind down with your night routine. Relax and prepare for rest.',
      scheduledTime: scheduledDate,
      payload: 'night_routine',
      channelId: NotificationChannels.routineReminder,
    );
  }

  /// Schedule all routines with default times
  Future<void> scheduleAllRoutines() async {
    await scheduleMorningRoutine(time: TimeOfDay(hour: 7, minute: 0));
    await scheduleAfternoonRoutine(time: TimeOfDay(hour: 14, minute: 0));
    await scheduleNightRoutine(time: TimeOfDay(hour: 21, minute: 0));
  }

  /// Show completion notification
  Future<void> showCompletionNotification({
    required String routineType,
  }) async {
    String title;
    String body;

    switch (routineType) {
      case 'morning':
        title = 'Morning Routine Completed!';
        body = 'Great job! You have completed your morning routine.';
        break;
      case 'afternoon':
        title = 'Afternoon Routine Completed!';
        body = 'Well done! You have finished your afternoon routine.';
        break;
      case 'night':
        title = 'Night Routine Completed!';
        body = 'Excellent! Sleep well after completing your night routine.';
        break;
      default:
        title = 'Routine Completed!';
        body = 'Great work on completing your routine!';
    }

    await _showImmediateNotification(
      id: NotificationIds.completionBase + routineType.hashCode,
      title: title,
      body: body,
      channelId: NotificationChannels.routineCompletion,
    );
  }

  /// Internal method to schedule notification
  Future<void> _scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
    required String channelId,
    String? payload,
  }) async {
    await _notifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          channelId,
          channelId == NotificationChannels.routineReminder
              ? 'Routine Reminders'
              : 'Routine Completion',
          channelDescription: 'Notifications for routines',
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: payload,
    );
  }

  /// Show immediate notification
  Future<void> _showImmediateNotification({
    required int id,
    required String title,
    required String body,
    required String channelId,
  }) async {
    await _notifications.show(
      id,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channelId,
          channelId == NotificationChannels.routineReminder
              ? 'Routine Reminders'
              : 'Routine Completion',
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
    );
  }

  /// Cancel specific routine notification
  Future<void> cancelRoutineNotification(String routineType) async {
    int id;
    switch (routineType) {
      case 'morning':
        id = NotificationIds.morningReminder;
        break;
      case 'afternoon':
        id = NotificationIds.afternoonReminder;
        break;
      case 'night':
        id = NotificationIds.nightReminder;
        break;
      default:
        return;
    }
    await _notifications.cancel(id);
  }

  /// Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }

  /// Get pending notifications
  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return await _notifications.pendingNotificationRequests();
  }
}

extension on Type {
  void operator >(other) {}
}
