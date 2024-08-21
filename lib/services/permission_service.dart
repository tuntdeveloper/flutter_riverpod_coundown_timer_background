import 'package:awesome_notifications/awesome_notifications.dart';

class PermissionService {
  static Future<void> requestPermission() async {
    await _requestNotificationPermission();
    //TODO: Add another one when needed
  }

  static Future<void> _requestNotificationPermission() {
    return AwesomeNotifications().isNotificationAllowed().then((isAllowed) async {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }
}
