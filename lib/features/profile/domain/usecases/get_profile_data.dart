import '../entities/profile_data.dart';
import '../repositories/profile_repository.dart';

class GetProfileData {
  final ProfileRepository repository;

  const GetProfileData(this.repository);

  Future<ProfileData> call() async {
    return repository.getProfileData();
  }
}
