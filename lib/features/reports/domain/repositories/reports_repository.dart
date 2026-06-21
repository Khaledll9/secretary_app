import '../entities/reports_data.dart';

abstract class ReportsRepository {
  Future<ReportsData> getReportsData();
  Future<BookingReportData> getBookingReport();
  Future<CoursesReportData> getCoursesReport();
}
