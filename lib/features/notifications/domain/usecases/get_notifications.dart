import '../entities/notification_data.dart';
import '../repositories/notification_repository.dart';

class GetNotifications {
  final NotificationRepository repository;

  const GetNotifications(this.repository);

  Future<List<NotificationData>> call() async {
    return repository.getNotifications();
  }
}
