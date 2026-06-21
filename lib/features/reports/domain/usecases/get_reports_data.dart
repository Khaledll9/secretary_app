import '../entities/reports_data.dart';
import '../repositories/reports_repository.dart';

class GetReportsData {
  final ReportsRepository repository;

  const GetReportsData(this.repository);

  Future<ReportsData> call() async {
    return repository.getReportsData();
  }
}
