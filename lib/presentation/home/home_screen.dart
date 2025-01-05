import 'package:flutter/material.dart';
import 'package:remind_me/models/reminder_model.dart';
import 'package:remind_me/presentation/reminders/reminders_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  RemindersScreen.route,
                );
              },
              child: const Text(
                'Reminder List',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Remind me App'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text(
            'Remind me',
          ),
        ),
      ),
    );
  }
}
