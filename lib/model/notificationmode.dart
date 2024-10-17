// lib/models/notification_model.dart

class NotificationModel {
  final String title;
  final String body;
  final String imageUrl;

  NotificationModel(
      {required this.title, required this.body, required this.imageUrl});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'] ?? 'No Title',
      body: json['body'] ?? 'No Description',
      imageUrl:
          json['image'] ?? '', // Assuming there's an image field in the JSON
    );
  }
}
