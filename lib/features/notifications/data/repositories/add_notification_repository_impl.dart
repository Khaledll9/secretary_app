import '../../domain/entities/add_notification_data.dart';
import '../../domain/repositories/add_notification_repository.dart';

class AddNotificationRepositoryImpl implements AddNotificationRepository {
  const AddNotificationRepositoryImpl();

  @override
  Future<bool> sendNotification(AddNotificationData data) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return true;
  }
}
