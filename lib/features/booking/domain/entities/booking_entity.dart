enum BookingStatus { pending, confirmed, cancelled, completed }

class BookingEntity {
  final String id;
  final BookingStatus status;
  final String courseName;
  final String courseCode;
  final String sessionInfo;
  final String date;
  final String time;
  final double price;
  final String? imageUrl;

  const BookingEntity({
    required this.id,
    required this.status,
    required this.courseName,
    required this.courseCode,
    required this.sessionInfo,
    required this.date,
    required this.time,
    required this.price,
    this.imageUrl,
  });
}

class BookingDetailsEntity {
  final String bookingId;
  final String studentName;
  final String courseName;
  final String bookingCode;
  final double registrationFee;
  final double remainingFee;
  final double totalPaid;

  const BookingDetailsEntity({
    required this.bookingId,
    required this.studentName,
    required this.courseName,
    required this.bookingCode,
    required this.registrationFee,
    required this.remainingFee,
    required this.totalPaid,
  });
}

class AttendanceEntity {
  final String bookingId;
  final String studentName;
  final String bookingCode;
  final String courseName;
  final String instructorName;
  final double registrationFee;
  final double remainingFee;
  final double totalPaid;

  const AttendanceEntity({
    required this.bookingId,
    required this.studentName,
    required this.bookingCode,
    required this.courseName,
    required this.instructorName,
    required this.registrationFee,
    required this.remainingFee,
    required this.totalPaid,
  });
}
