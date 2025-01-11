import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:remind_me/api/firebase_api.dart';
import 'package:remind_me/api/firebase_config_api.dart';
import 'package:remind_me/firebase_options.dart';
import 'package:remind_me/models/reminder_model.dart';
import 'package:remind_me/presentation/home/home_screen.dart';
import 'package:remind_me/presentation/reminders/reminders_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();
  await FirebaseConfigApi().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Remind me App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: FirebaseConfigApi().getPrimaryColor()),
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
        ),
        textTheme: const TextTheme(
          /// [labelLarge] style for Button's text
          labelLarge: TextStyle(fontSize: 32),
        ),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      home: const HomeScreen(),
      routes: {
        RemindersScreen.route: (context) => RemindersScreen(
              reminders: ReminderModel.mockReminderList,
            ),
      },
    );
  }
}
