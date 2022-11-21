import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService{
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('drawable/ic_launcher');

    DarwinInitializationSettings iosInitializationSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification
    );

    final InitializationSettings settings = InitializationSettings(android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _localNotificationService.initialize(settings);
    print("success initialize local notif");

  }

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails('channel_id', 'channel_name', channelDescription: 'description',
    importance: Importance.max, priority: Priority.max, playSound: true);

    const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails();

    return NotificationDetails(android: androidNotificationDetails, iOS: darwinNotificationDetails);
  }

  Future<void> showNotification({
  required int id,
    required String title,
    required String body
}) async {
    final details = await _notificationDetails();
    await _localNotificationService.show(id, title, body, details);

  }

  void _onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) {
    print('id $id');

  }
}