import '../entities/sign_in_data.dart';
import '../repositories/sign_in_repository.dart';

class SignIn {
  final SignInRepository repository;

  const SignIn(this.repository);

  Future<AuthUser> call(SignInData data) async {
    return repository.authenticate(data);
  }
}
