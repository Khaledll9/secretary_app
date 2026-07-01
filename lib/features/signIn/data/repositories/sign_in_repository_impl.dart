import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/api/token_manager.dart';
import '../../../../core/storage/local_storage.dart';
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
      String errorMessage = 'فشل تسجيل الدخول';

      if (authResponse.errors != null && authResponse.errors!.isNotEmpty) {
        final firstError = authResponse.errors!.values.first;
        if (firstError is List && firstError.isNotEmpty) {
          errorMessage = firstError.first.toString();
        } else {
          errorMessage = firstError.toString();
        }
      } else if (authResponse.message != null) {
        errorMessage = authResponse.message!;
      }

      throw Exception(errorMessage);
    }

    final token = authResponse.data!.token!;
    final userModel = authResponse.data!.user;

    TokenManager.setToken(token);
    await LocalStorage.saveToken(token);

    if (userModel != null) {
      await LocalStorage.saveUserData({
        'id': userModel.id,
        'name': userModel.name,
        'institute_id': userModel.instituteId,
        'roles': userModel.roles?.map((r) => r.name).toList() ?? [],
      });
    }

    return AuthUser(
      id: userModel?.id ?? 0,
      name: userModel?.name ?? '',
      token: token,
      roles: userModel?.roles?.map((r) => r.name).toList() ?? [],
      instituteId: userModel?.instituteId,
    );
  }
}
