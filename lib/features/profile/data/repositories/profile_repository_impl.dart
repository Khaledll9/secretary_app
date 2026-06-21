import '../../domain/entities/profile_data.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl();

  @override
  Future<ProfileData> getProfileData() async {
    await Future<void>.delayed(const Duration(milliseconds: 150));
    return const ProfileData(
      name: 'سارة أحمد',
      email: 'sara.ahmed@yusur.sa',
    );
  }
}
