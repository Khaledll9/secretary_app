import '../../domain/entities/reset_password_data.dart';
import '../../domain/repositories/reset_password_repository.dart';

class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  const ResetPasswordRepositoryImpl();

  @override
  Future<bool> savePassword(ResetPasswordData data) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return true;
  }
}
