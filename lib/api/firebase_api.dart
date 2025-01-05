import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:remind_me/config/config.dart';
import 'package:remind_me/main.dart';
import 'package:remind_me/presentation/reminders/reminders_screen.dart';

/// [handleBackgroundMessage] must be top-level function
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  debugPrint('Title : ${message.notification?.title}');
  debugPrint('Body: ${message.notification?.body}');
  debugPrint('Payload: ${message.data}');
}

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentState?.pushNamed(
      RemindersScreen.route,
      arguments: message,
    );
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    Config.fcmToken = await _firebaseMessaging.getToken();
    debugPrint('Token: ${Config.fcmToken}');
    await initPushNotifications();
  }
}
