import '../entities/reset_password_data.dart';
import '../repositories/reset_password_repository.dart';

class SavePassword {
  final ResetPasswordRepository repository;

  const SavePassword(this.repository);

  Future<bool> call(ResetPasswordData data) async {
    return repository.savePassword(data);
  }
}
