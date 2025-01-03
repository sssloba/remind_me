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
}
