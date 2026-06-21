import 'package:flutter_riverpod/legacy.dart';
import '../../domain/entities/booking_entity.dart';
import '../../domain/repositories/booking_repository.dart';
import 'booking_provider.dart';

enum BookingDetailsStatus { idle, loading, success, error }

class BookingDetailsState {
  final BookingDetailsStatus status;
  final String? errorMessage;
  final BookingDetailsEntity? details;

  const BookingDetailsState({
    this.status = BookingDetailsStatus.idle,
    this.errorMessage,
    this.details,
  });

  BookingDetailsState copyWith({
    BookingDetailsStatus? status,
    String? errorMessage,
    BookingDetailsEntity? details,
  }) {
    return BookingDetailsState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      details: details ?? this.details,
    );
  }
}

class BookingDetailsNotifier extends StateNotifier<BookingDetailsState> {
  final BookingRepository _repository;
  final String bookingId;

  BookingDetailsNotifier(this._repository, this.bookingId) : super(const BookingDetailsState());

  Future<void> loadDetails() async {
    state = state.copyWith(status: BookingDetailsStatus.loading);
    try {
      final details = await _repository.getBookingDetails(bookingId);
      state = state.copyWith(
        status: BookingDetailsStatus.success,
        details: details,
      );
    } catch (e) {
      state = state.copyWith(
        status: BookingDetailsStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> confirmAttendance() async {
    state = state.copyWith(status: BookingDetailsStatus.loading);
    try {
      await _repository.confirmAttendance(bookingId);
      state = state.copyWith(status: BookingDetailsStatus.success);
    } catch (e) {
      state = state.copyWith(
        status: BookingDetailsStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> cancelBooking() async {
    state = state.copyWith(status: BookingDetailsStatus.loading);
    try {
      await _repository.cancelBooking(bookingId);
      state = state.copyWith(status: BookingDetailsStatus.idle);
    } catch (e) {
      state = state.copyWith(
        status: BookingDetailsStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  void reset() {
    state = const BookingDetailsState();
  }
}

final bookingDetailsProvider = StateNotifierProvider.family<BookingDetailsNotifier, BookingDetailsState, String>((ref, bookingId) {
  final repository = ref.watch(bookingRepositoryProvider);
  return BookingDetailsNotifier(repository, bookingId);
});
