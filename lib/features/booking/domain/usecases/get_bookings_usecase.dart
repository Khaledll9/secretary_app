import '../entities/booking_entity.dart';
import '../repositories/booking_repository.dart';

class GetBookingsUseCase {
  final BookingRepository repository;

  GetBookingsUseCase({required this.repository});

  Future<List<BookingEntity>> call() => repository.getBookings();
}
