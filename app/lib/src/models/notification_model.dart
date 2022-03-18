class NotificationModel {
  NotificationModel({this.createdAt, this.notification, this.user, this.image});
  final String? user;
  final String? createdAt;
  final String? notification;
  final String? image;

  static NotificationModel fromJson(json) {
    return NotificationModel(
        user: json["user"],
        createdAt: json["created_at"],
        image: json["image"],
        notification: json["notification"]);
  }
}
