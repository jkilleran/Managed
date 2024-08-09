import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


abstract class LocalNotifications {
  void init({
    required Future<void> Function(String? payload) onSelectNotification,
    required Future<void> Function(int id, String? title, String? body, String? payload) onDidReceiveLocalNotification,
  });
}

class WebLocalNotifications extends LocalNotifications {
  @override
  void init({
    required Future<void> Function(String? payload) onSelectNotification,
    required Future<void> Function(int id, String? title, String? body, String? payload) onDidReceiveLocalNotification,
  }) {
    // no-op
  }
}

class MobileLocalNotifications extends LocalNotifications {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  MobileLocalNotifications()
      : flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void init({
    required Future<void> Function(String? payload) onSelectNotification,
    required Future<void> Function(int id, String? title, String? body, String? payload) onDidReceiveLocalNotification,
  }) {
    var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings();

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    ).then((_) {
      _setupNotification();
    });
  }

  void _setupNotification() async {
    var time = Time(16, 11, 0);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'daily-notifications', 
      'Daily Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.showDailyAtTime(
      0,
      'Spend-o-meter',
      "Don't forget to add your expenses",
      time,
      platformChannelSpecifics,
    );
  }
}