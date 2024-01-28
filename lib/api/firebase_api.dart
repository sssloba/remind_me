import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:remind_me/congif/config.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  debugPrint('Title : ${message.notification?.title}');
  debugPrint('Body: ${message.notification?.body}');
  debugPrint('Payload: ${message.data}');
}

class FirebaseApi {
  final FirebaseMessaging _firebaseMessagin = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessagin.requestPermission();
    Config.fcmToken = await _firebaseMessagin.getToken();
    debugPrint('Token: ${Config.fcmToken}');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
