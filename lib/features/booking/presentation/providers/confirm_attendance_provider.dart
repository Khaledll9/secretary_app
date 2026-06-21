import 'package:flutter_riverpod/legacy.dart';
import '../../domain/entities/booking_entity.dart';
import '../../domain/repositories/booking_repository.dart';
import 'booking_provider.dart';

enum ConfirmAttendanceStatus { idle, loading, success, error }

class ConfirmAttendanceState {
  final ConfirmAttendanceStatus status;
  final String? errorMessage;
  final AttendanceEntity? attendance;

  const ConfirmAttendanceState({
    this.status = ConfirmAttendanceStatus.idle,
    this.errorMessage,
    this.attendance,
  });

  ConfirmAttendanceState copyWith({
    ConfirmAttendanceStatus? status,
    String? errorMessage,
    AttendanceEntity? attendance,
  }) {
    return ConfirmAttendanceState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      attendance: attendance ?? this.attendance,
    );
  }
}

class ConfirmAttendanceNotifier extends StateNotifier<ConfirmAttendanceState> {
  final BookingRepository _repository;
  final String bookingId;

  ConfirmAttendanceNotifier(this._repository, this.bookingId) : super(const ConfirmAttendanceState());

  Future<void> loadAttendance() async {
    state = state.copyWith(status: ConfirmAttendanceStatus.loading);
    try {
      final response = await _repository.getBookingDetails(bookingId);
      final attendance = AttendanceEntity(
        bookingId: response.bookingId,
        studentName: response.studentName,
        bookingCode: response.bookingCode,
        courseName: response.courseName,
        instructorName: 'أ. محمد عبدالله',
        registrationFee: response.registrationFee,
        remainingFee: response.remainingFee,
        totalPaid: response.totalPaid,
      );
      state = state.copyWith(
        status: ConfirmAttendanceStatus.idle,
        attendance: attendance,
      );
    } catch (e) {
      state = state.copyWith(
        status: ConfirmAttendanceStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> confirmAttendance() async {
    state = state.copyWith(status: ConfirmAttendanceStatus.loading);
    try {
      await _repository.confirmAttendance(bookingId);
      state = state.copyWith(status: ConfirmAttendanceStatus.success);
    } catch (e) {
      state = state.copyWith(
        status: ConfirmAttendanceStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> cancelBooking() async {
    state = state.copyWith(status: ConfirmAttendanceStatus.loading);
    try {
      await _repository.cancelBooking(bookingId);
      state = state.copyWith(status: ConfirmAttendanceStatus.idle);
    } catch (e) {
      state = state.copyWith(
        status: ConfirmAttendanceStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  void reset() {
    state = const ConfirmAttendanceState();
  }
}

final confirmAttendanceProvider = StateNotifierProvider.family<ConfirmAttendanceNotifier, ConfirmAttendanceState, String>((ref, bookingId) {
  final repository = ref.watch(bookingRepositoryProvider);
  return ConfirmAttendanceNotifier(repository, bookingId);
});
