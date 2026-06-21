import '../entities/reports_data.dart';
import '../repositories/reports_repository.dart';

class GetBookingReport {
  final ReportsRepository repository;

  const GetBookingReport(this.repository);

  Future<BookingReportData> call() async {
    return repository.getBookingReport();
  }
}
