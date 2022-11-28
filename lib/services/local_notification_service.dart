import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService{
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('@mipmap/launcher_icon.png');

    DarwinInitializationSettings iosInitializationSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification
    );

    final InitializationSettings settings = InitializationSettings(android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _localNotificationService.initialize(settings);
    print("success initialize local notif");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print(".......onMessage........");
      print("onMessage: ${message.notification?.title}/${message.notification?.body}");

      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(), htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(), htmlFormatContentTitle: true,
      );

      AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails('channel_id', 'channel_name', channelDescription: 'description',
          importance: Importance.max, priority: Priority.max, styleInformation: bigTextStyleInformation, playSound: true);

      NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidNotificationDetails, iOS: DarwinNotificationDetails());
      await _localNotificationService.show(0,message.notification!.title, message.notification!.body, platformChannelSpecifics);
    });

  }

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails('channel_id', 'channel_name', channelDescription: 'description',
    importance: Importance.max, priority: Priority.max, playSound: true);

    const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails();

    return NotificationDetails(android: androidNotificationDetails, iOS: darwinNotificationDetails);
  }

  Future<void> showNotification({
  required int id,
    String? title,
    String? body
}) async {
    final details = await _notificationDetails();
    await _localNotificationService.show(id, title, body, details);

  }

  void _onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) {
    print('id $id');

  }
}