import '../entities/add_notification_data.dart';

abstract class AddNotificationRepository {
  Future<bool> sendNotification(AddNotificationData data);
}
