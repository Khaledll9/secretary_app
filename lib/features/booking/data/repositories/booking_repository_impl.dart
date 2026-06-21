import 'package:secretary_app/core/api/api_consumer.dart';
import 'package:secretary_app/core/api/end_points.dart';
import '../../domain/entities/booking_entity.dart';
import '../../domain/repositories/booking_repository.dart';
import '../models/booking_model.dart';

class BookingRepositoryImpl implements BookingRepository {
  final ApiConsumer api;

  BookingRepositoryImpl({required this.api});

  @override
  Future<List<BookingEntity>> getBookings() async {
    try {
      final response = await api.get(EndPoint.viewCourses);
      final List<dynamic> data = response[ApiKey.data] ?? [];
      return data
          .map((json) => BookingModel.fromJson(json as Map<String, dynamic>))
          .map((m) => m.toEntity())
          .toList();
    } catch (_) {
      return _mockBookings;
    }
  }

  @override
  Future<BookingDetailsEntity> getBookingDetails(String bookingId) async {
    try {
      final response = await api.get('bookings/$bookingId');
      final data = response[ApiKey.data] as Map<String, dynamic>;
      return BookingDetailsModel.fromJson(data).toEntity();
    } catch (_) {
      return _mockBookingDetails.firstWhere(
        (d) => d.bookingId == bookingId,
        orElse: () => _mockBookingDetails.first,
      );
    }
  }

  @override
  Future<void> confirmAttendance(String bookingId) async {
    try {
      await api.post('bookings/$bookingId/confirm-attendance');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> cancelBooking(String bookingId) async {
    try {
      await api.post('bookings/$bookingId/cancel');
    } catch (_) {
      rethrow;
    }
  }
}

final List<BookingEntity> _mockBookings = [
  BookingEntity(
    id: '1',
    status: BookingStatus.pending,
    courseName: 'دورة اللغة العربية',
    courseCode: 'YSR-782',
    sessionInfo: 'تدريب إلكتروني - أونلاين',
    date: 'قبل 2 يوم',
    time: 'الساعة 3:00 م',
    price: 3000,
  ),
  BookingEntity(
    id: '2',
    status: BookingStatus.confirmed,
    courseName: 'دورة المحادثة باللغة الإنجليزية',
    courseCode: 'YSR-782',
    sessionInfo: 'تدريب حضوري - قاعة 3',
    date: '20 Oct',
    time: 'الساعة 10:00 ص',
    price: 5000,
  ),
  BookingEntity(
    id: '3',
    status: BookingStatus.cancelled,
    courseName: 'دورة مهارات التواصل',
    courseCode: 'YSR-782',
    sessionInfo: 'تدريب عن بعد',
    date: '15 Oct',
    time: 'الساعة 2:00 م',
    price: 2500,
  ),
  BookingEntity(
    id: '4',
    status: BookingStatus.completed,
    courseName: 'دورة القيادة والإدارة',
    courseCode: 'YSR-782',
    sessionInfo: 'تدريب مكثف - حضور مباشر',
    date: 'قبل 5 أيام',
    time: 'الساعة 9:00 ص',
    price: 2000,
  ),
];

final List<BookingDetailsEntity> _mockBookingDetails = [
  BookingDetailsEntity(
    bookingId: '1',
    studentName: 'أحمد محمد',
    courseName: 'دورة اللغة العربية',
    bookingCode: 'BK-98765-2024',
    registrationFee: 7000,
    remainingFee: 2000,
    totalPaid: 5000,
  ),
  BookingDetailsEntity(
    bookingId: '2',
    studentName: 'فاطمة علي',
    courseName: 'دورة المحادثة باللغة الإنجليزية',
    bookingCode: 'BK-12345-2024',
    registrationFee: 8000,
    remainingFee: 3000,
    totalPaid: 5000,
  ),
];
