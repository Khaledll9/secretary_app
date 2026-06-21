import '../entities/booking_entity.dart';

abstract class BookingRepository {
  Future<List<BookingEntity>> getBookings();
  Future<BookingDetailsEntity> getBookingDetails(String bookingId);
  Future<void> confirmAttendance(String bookingId);
  Future<void> cancelBooking(String bookingId);
}
