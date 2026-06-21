import 'package:flutter_riverpod/legacy.dart';

enum AddBookingStatus { idle, loading, success, error }

enum AttendanceType { remote, inPerson }

class AddBookingState {
  final AddBookingStatus status;
  final String? errorMessage;

  final String selectedCourse;
  final String courseName;
  final String department;
  final String originalPrice;
  final String instructorName;
  final String description;
  final String duration;
  final DateTime? endDate;
  final String maxSeats;
  final AttendanceType attendanceType;
  final bool isFree;
  final bool includesCertificate;
  final String discountAmount;

  const AddBookingState({
    this.status = AddBookingStatus.idle,
    this.errorMessage,
    this.selectedCourse = '',
    this.courseName = '',
    this.department = '',
    this.originalPrice = '',
    this.instructorName = '',
    this.description = '',
    this.duration = '',
    this.endDate,
    this.maxSeats = '',
    this.attendanceType = AttendanceType.remote,
    this.isFree = false,
    this.includesCertificate = false,
    this.discountAmount = '',
  });

  AddBookingState copyWith({
    AddBookingStatus? status,
    String? errorMessage,
    String? selectedCourse,
    String? courseName,
    String? department,
    String? originalPrice,
    String? instructorName,
    String? description,
    String? duration,
    DateTime? endDate,
    String? maxSeats,
    AttendanceType? attendanceType,
    bool? isFree,
    bool? includesCertificate,
    String? discountAmount,
  }) {
    return AddBookingState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      selectedCourse: selectedCourse ?? this.selectedCourse,
      courseName: courseName ?? this.courseName,
      department: department ?? this.department,
      originalPrice: originalPrice ?? this.originalPrice,
      instructorName: instructorName ?? this.instructorName,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      endDate: endDate ?? this.endDate,
      maxSeats: maxSeats ?? this.maxSeats,
      attendanceType: attendanceType ?? this.attendanceType,
      isFree: isFree ?? this.isFree,
      includesCertificate: includesCertificate ?? this.includesCertificate,
      discountAmount: discountAmount ?? this.discountAmount,
    );
  }
}

class AddBookingNotifier extends StateNotifier<AddBookingState> {
  AddBookingNotifier() : super(const AddBookingState());

  void setSelectedCourse(String? value) {
    state = state.copyWith(selectedCourse: value ?? '');
  }

  void setCourseName(String value) {
    state = state.copyWith(courseName: value);
  }

  void setDepartment(String? value) {
    state = state.copyWith(department: value ?? '');
  }

  void setOriginalPrice(String value) {
    state = state.copyWith(originalPrice: value);
  }

  void setInstructorName(String value) {
    state = state.copyWith(instructorName: value);
  }

  void setDescription(String value) {
    state = state.copyWith(description: value);
  }

  void setDuration(String value) {
    state = state.copyWith(duration: value);
  }

  void setEndDate(DateTime? value) {
    state = state.copyWith(endDate: value);
  }

  void setMaxSeats(String value) {
    state = state.copyWith(maxSeats: value);
  }

  void setAttendanceType(AttendanceType value) {
    state = state.copyWith(attendanceType: value);
  }

  void toggleIsFree() {
    state = state.copyWith(isFree: !state.isFree);
  }

  void toggleIncludesCertificate() {
    state = state.copyWith(includesCertificate: !state.includesCertificate);
  }

  void setDiscountAmount(String value) {
    state = state.copyWith(discountAmount: value);
  }

  Future<void> submit() async {
    state = state.copyWith(status: AddBookingStatus.loading);
    try {
      await Future.delayed(const Duration(seconds: 1));
      state = state.copyWith(status: AddBookingStatus.success);
    } catch (e) {
      state = state.copyWith(
        status: AddBookingStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  void reset() {
    state = const AddBookingState();
  }
}

final addBookingProvider =
    StateNotifierProvider<AddBookingNotifier, AddBookingState>((ref) {
  return AddBookingNotifier();
});
