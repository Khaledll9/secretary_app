import '../entities/sign_in_data.dart';

abstract class SignInRepository {
  Future<AuthUser> authenticate(SignInData data);
}
