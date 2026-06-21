import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/api/errors/exceptions.dart';
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

    try {
      final response = await api.post(
        EndPoint.login,
        data: request.toJson(),
      );

      final authResponse =
          AuthResponseModel.fromJson(response as Map<String, dynamic>);

      if (authResponse.status != true ||
          authResponse.data == null ||
          authResponse.data!.token == null ||
          authResponse.data!.token!.isEmpty) {
        throw Exception(_extractErrorMessage(authResponse));
      }

      TokenManager.setToken(authResponse.data!.token);

      return _mapUser(authResponse.data!.user);
    } on ServerException catch (e) {
      throw Exception(
        e.errModel.errorMessage.isNotEmpty
            ? e.errModel.errorMessage
            : 'حدث خطأ في الخادم',
      );
    } catch (e) {
      if (e is Exception) rethrow;
      throw Exception('حدث خطأ غير متوقع');
    }
  }

  String _extractErrorMessage(AuthResponseModel response) {
    if (response.message != null && response.message!.isNotEmpty) {
      return _translateMessage(response.message!);
    }
    if (response.errors != null && response.errors!.isNotEmpty) {
      final firstError = response.errors!.values.firstOrNull;
      if (firstError is List && firstError.isNotEmpty) {
        return firstError.first.toString();
      }
      if (firstError != null) return firstError.toString();
    }
    return 'فشل تسجيل الدخول';
  }

  String _translateMessage(String message) {
    if (message == 'validation.custom.auth.login_success') {
      return 'تم تسجيل الدخول بنجاح';
    }
    if (message.contains('login_failed') ||
        message.contains('credentials') ||
        message.contains('unauthorized') ||
        message.contains('Invalid') ||
        message.contains('login_id.invalid')) {
      return 'البريد الإلكتروني أو كلمة المرور غير صحيحة';
    }
    return message;
  }

  AuthUser _mapUser(UserModel? userData) {
    if (userData == null) {
      return const AuthUser(id: 0);
    }

    final roleName =
        userData.roles != null && userData.roles!.isNotEmpty
            ? userData.roles![0].name
            : null;

    final resolvedNameAr = userData.profile?.fullNameAr ?? userData.name;
    final resolvedNameEn = userData.profile?.fullNameEn ?? userData.name;

    return AuthUser(
      id: userData.id,
      name: userData.name,
      nameAr: resolvedNameAr,
      nameEn: resolvedNameEn,
      email: userData.email,
      role: roleName,
      instituteId: userData.instituteId,
    );
  }
}
