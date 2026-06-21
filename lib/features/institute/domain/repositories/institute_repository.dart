import '../entities/institute_data.dart';

abstract class InstituteRepository {
  Future<InstituteData> getInstituteData();
}
