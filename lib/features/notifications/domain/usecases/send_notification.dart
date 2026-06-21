import '../entities/add_notification_data.dart';
import '../repositories/add_notification_repository.dart';

class SendNotification {
  final AddNotificationRepository repository;

  const SendNotification(this.repository);

  Future<bool> call(AddNotificationData data) async {
    return repository.sendNotification(data);
  }
}
