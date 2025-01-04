import 'package:flutter/material.dart';
import 'package:remind_me/models/reminder_model.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({
    required this.reminders,
    super.key,
  });

  final List<ReminderModel> reminders;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminder List'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final time = reminders[index].reminderTime;
            return ListTile(
              title: Text(reminders[index].title),
              subtitle: Text(reminders[index].text ?? ''),
              trailing: Text(
                'Time:\n${time.day}.${time.month}.${time.year}\n${time.hour}.${time.minute}',
                textAlign: TextAlign.center,
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(
                color: Colors.blue,
              ),
          itemCount: reminders.length),
    );
  }
}
