import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class FirebaseConfigApi {
  final _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> init() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(days: 1),
      ),
    );

    await _remoteConfig.setDefaults({"primary_color": "green"});
    await _remoteConfig.fetchAndActivate();
  }

  Color getPrimaryColor() {
    final primaryColor = _remoteConfig.getString("primary_color");
    log(primaryColor);
    switch (primaryColor) {
      case "green":
        return Colors.green;
      case "red":
        return Colors.red;
      case "blue":
        return Colors.blue;
      default:
        return Colors.deepPurple;
    }
  }
}
