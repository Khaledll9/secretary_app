import '../entities/reset_password_data.dart';

abstract class ResetPasswordRepository {
  Future<bool> savePassword(ResetPasswordData data);
}
