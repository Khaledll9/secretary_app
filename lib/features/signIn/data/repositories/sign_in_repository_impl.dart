import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/api/token_manager.dart';
import '../../domain/entities/sign_in_data.dart';
import '../../domain/repositories/sign_in_repository.dart';
import '../models/auth_response_model.dart';
import '../models/login_request_model.dart';

class SignInRepositoryImpl implements SignInRepository {
  final ApiConsumer api;

  const SignInRepositoryImpl({required this.api});

  @override
  Future<AuthUser> authenticate(SignInData data) async {
    final request = LoginRequestModel(
      loginId: data.loginId,
      password: data.password,
    );

    final response = await api.post(
      EndPoint.login,
      data: request.toJson(),
    );

    final authResponse =
        AuthResponseModel.fromJson(response as Map<String, dynamic>);

    if (authResponse.status != true ||
        authResponse.data == null ||
        authResponse.data!.token == null) {
      final errorMessage = authResponse.message ??
          authResponse.errors?.values.expand((e) {
            if (e is List) return e;
            return [e.toString()];
          }).firstOrNull ??
          'فشل تسجيل الدخول';
      throw Exception(errorMessage);
    }

    TokenManager.setToken(authResponse.data!.token);

    final userData = authResponse.data!.user;
    return AuthUser(
      id: userData?.id ?? 0,
      nameAr: userData?.nameAr,
      nameEn: userData?.nameEn,
      email: userData?.email,
      type: userData?.type,
    );
  }
}
