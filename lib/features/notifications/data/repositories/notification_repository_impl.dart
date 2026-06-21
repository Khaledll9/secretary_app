import '../../domain/entities/notification_data.dart';
import '../../domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  const NotificationRepositoryImpl();

  @override
  Future<List<NotificationData>> getNotifications() async {
    await Future<void>.delayed(const Duration(milliseconds: 150));
    return const [
      NotificationData(
        id: '1',
        title: 'تذكير بموعد الدورة التدريبية',
        timeText: 'منذ ساعتين',
        audienceText: 'طلاب دورة اللغة الإنجليزية المستوى 1',
        sentCountText: 'تم الإرسال لـ 150 طالب',
      ),
      NotificationData(
        id: '2',
        title: 'إعلان عطلة نهاية الأسبوع المطولة',
        timeText: '15 أكتوبر 2023',
        audienceText: 'كافة المسجلين بالمنصة',
        sentCountText: 'تم الإرسال لـ 1,240 شخص',
      ),
    ];
  }
}
