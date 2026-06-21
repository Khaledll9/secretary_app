import '../entities/edit_profile_data.dart';
import '../repositories/edit_profile_repository.dart';

class SaveProfile {
  final EditProfileRepository repository;

  const SaveProfile(this.repository);

  Future<bool> call(EditProfileData data) async {
    return repository.saveProfile(data);
  }
}
