import '../../domain/entities/booking_entity.dart';

class BookingModel {
  final String id;
  final String status;
  final String courseName;
  final String courseCode;
  final String sessionInfo;
  final String date;
  final String time;
  final double price;
  final String? imageUrl;

  const BookingModel({
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

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] as String,
      status: json['status'] as String,
      courseName: json['course_name'] as String,
      courseCode: json['course_code'] as String,
      sessionInfo: json['session_info'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'course_name': courseName,
        'course_code': courseCode,
        'session_info': sessionInfo,
        'date': date,
        'time': time,
        'price': price,
        'image_url': imageUrl,
      };

  BookingEntity toEntity() => BookingEntity(
        id: id,
        status: BookingStatus.values.firstWhere(
          (s) => s.name == status,
          orElse: () => BookingStatus.pending,
        ),
        courseName: courseName,
        courseCode: courseCode,
        sessionInfo: sessionInfo,
        date: date,
        time: time,
        price: price,
        imageUrl: imageUrl,
      );
}

class BookingDetailsModel {
  final String bookingId;
  final String studentName;
  final String courseName;
  final String bookingCode;
  final double registrationFee;
  final double remainingFee;
  final double totalPaid;

  const BookingDetailsModel({
    required this.bookingId,
    required this.studentName,
    required this.courseName,
    required this.bookingCode,
    required this.registrationFee,
    required this.remainingFee,
    required this.totalPaid,
  });

  factory BookingDetailsModel.fromJson(Map<String, dynamic> json) {
    return BookingDetailsModel(
      bookingId: json['booking_id'] as String,
      studentName: json['student_name'] as String,
      courseName: json['course_name'] as String,
      bookingCode: json['booking_code'] as String,
      registrationFee: (json['registration_fee'] as num).toDouble(),
      remainingFee: (json['remaining_fee'] as num).toDouble(),
      totalPaid: (json['total_paid'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'booking_id': bookingId,
        'student_name': studentName,
        'course_name': courseName,
        'booking_code': bookingCode,
        'registration_fee': registrationFee,
        'remaining_fee': remainingFee,
        'total_paid': totalPaid,
      };

  BookingDetailsEntity toEntity() => BookingDetailsEntity(
        bookingId: bookingId,
        studentName: studentName,
        courseName: courseName,
        bookingCode: bookingCode,
        registrationFee: registrationFee,
        remainingFee: remainingFee,
        totalPaid: totalPaid,
      );
}

class AttendanceModel {
  final String bookingId;
  final String studentName;
  final String bookingCode;
  final String courseName;
  final String instructorName;
  final double registrationFee;
  final double remainingFee;
  final double totalPaid;

  const AttendanceModel({
    required this.bookingId,
    required this.studentName,
    required this.bookingCode,
    required this.courseName,
    required this.instructorName,
    required this.registrationFee,
    required this.remainingFee,
    required this.totalPaid,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      bookingId: json['booking_id'] as String,
      studentName: json['student_name'] as String,
      bookingCode: json['booking_code'] as String,
      courseName: json['course_name'] as String,
      instructorName: json['instructor_name'] as String,
      registrationFee: (json['registration_fee'] as num).toDouble(),
      remainingFee: (json['remaining_fee'] as num).toDouble(),
      totalPaid: (json['total_paid'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'booking_id': bookingId,
        'student_name': studentName,
        'booking_code': bookingCode,
        'course_name': courseName,
        'instructor_name': instructorName,
        'registration_fee': registrationFee,
        'remaining_fee': remainingFee,
        'total_paid': totalPaid,
      };

  AttendanceEntity toEntity() => AttendanceEntity(
        bookingId: bookingId,
        studentName: studentName,
        bookingCode: bookingCode,
        courseName: courseName,
        instructorName: instructorName,
        registrationFee: registrationFee,
        remainingFee: remainingFee,
        totalPaid: totalPaid,
      );
}
