import '../entities/notification_data.dart';

abstract class NotificationRepository {
  Future<List<NotificationData>> getNotifications();
}
