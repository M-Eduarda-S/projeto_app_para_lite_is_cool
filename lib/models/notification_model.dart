class NotificationModel {
  final String id;
  final String title;
  final String content;
  final String iconType; // 'report', 'attendance', 'calendar', 'photos'

  NotificationModel({
    required this.id,
    required this.title,
    required this.content,
    required this.iconType,
  });
}
