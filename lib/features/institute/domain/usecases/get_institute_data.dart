import '../entities/institute_data.dart';
import '../repositories/institute_repository.dart';

class GetInstituteData {
  final InstituteRepository repository;

  const GetInstituteData(this.repository);

  Future<InstituteData> call() async {
    return repository.getInstituteData();
  }
}
