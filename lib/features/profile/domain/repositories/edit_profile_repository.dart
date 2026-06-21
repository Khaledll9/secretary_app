import '../entities/edit_profile_data.dart';

abstract class EditProfileRepository {
  Future<bool> saveProfile(EditProfileData data);
}
