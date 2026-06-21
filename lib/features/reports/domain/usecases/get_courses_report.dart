import '../entities/reports_data.dart';
import '../repositories/reports_repository.dart';

class GetCoursesReport {
  final ReportsRepository repository;

  const GetCoursesReport(this.repository);

  Future<CoursesReportData> call() async {
    return repository.getCoursesReport();
  }
}
