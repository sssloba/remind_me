import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:remind_me/config/config.dart';

/// [handleBackgroundMessage] must be top-level function
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  debugPrint('Title : ${message.notification?.title}');
  debugPrint('Body: ${message.notification?.body}');
  debugPrint('Payload: ${message.data}');
}

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    Config.fcmToken = await _firebaseMessaging.getToken();
    debugPrint('Token: ${Config.fcmToken}');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
