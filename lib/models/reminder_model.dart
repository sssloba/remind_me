class ReminderModel {
  final String id;
  final String title;
  final String? text;
  final DateTime reminderTime;

  /// [name] used to identify this notification on Firebase. This [name] is not shown to users.
  final String? name;

  ReminderModel({
    required this.id,
    required this.title,
    this.text,
    required this.reminderTime,
    this.name,
  });

  static List<ReminderModel> get mockReminderList => <ReminderModel>[
        ReminderModel(
          id: 'Mock1',
          title: 'Mock 1 Reminder Title',
          text: 'This is Mock 1 Reminder Text',
          reminderTime: DateTime.now().add(
            const Duration(hours: 1),
          ),
          name: 'mock_1_reminder',
        ),
        ReminderModel(
          id: 'Mock2',
          title: 'Mock 2 Reminder Title',
          text: 'This is Mock 2 Reminder Text',
          reminderTime: DateTime.now().add(
            const Duration(hours: 2),
          ),
          name: 'mock_2_reminder',
        ),
        ReminderModel(
          id: 'Mock3',
          title: 'Mock 3 Reminder Title',
          text: 'This is Mock 3 Reminder Text',
          reminderTime: DateTime.now().add(
            const Duration(hours: 3),
          ),
          name: 'mock_3_reminder',
        ),
      ];
}
