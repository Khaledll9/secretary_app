import '../../domain/entities/edit_profile_data.dart';
import '../../domain/repositories/edit_profile_repository.dart';

class EditProfileRepositoryImpl implements EditProfileRepository {
  const EditProfileRepositoryImpl();

  @override
  Future<bool> saveProfile(EditProfileData data) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return true;
  }
}
