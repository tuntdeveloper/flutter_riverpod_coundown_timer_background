import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static Future<bool> initialize() {
    return AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            icon: null,
            importance: NotificationImportance.Low,
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            soundSource: null,
            playSound: false,
            enableVibration: false,
            vibrationPattern: null,
            defaultRingtoneType: null,
            enableLights: false,
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'basic_channel_group', channelGroupName: 'Basic group')
      ],
      debug: true,
    );
  }

  static Future<bool> createNotification(int id, String content) {
    return AwesomeNotifications().createNotification(
      content: NotificationContent(
        wakeUpScreen: false,
        id: id,
        channelKey: 'basic_channel',
        title: 'Countdown Timer',
        body: content,
      ),
    );
  }

  static Future<void> dismissAllNotification() {
    return AwesomeNotifications().dismissAllNotifications();
  }
}
