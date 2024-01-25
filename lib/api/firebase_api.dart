import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:remind_me/congif/config.dart';

class FirebaseApi {
  final FirebaseMessaging _firebaseMessagin = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessagin.requestPermission();
    Config.fcmToken = await _firebaseMessagin.getToken();
    debugPrint('Token ${Config.fcmToken}');
  }
}
