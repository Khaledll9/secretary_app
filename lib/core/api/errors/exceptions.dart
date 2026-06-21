import 'package:dio/dio.dart';

import 'error_model.dart';

class ServerException implements Exception {
  final ErrorModel errModel;

  ServerException({required this.errModel});
}

void handleDioExceptions(DioException e) {
  final statusCode = e.response?.statusCode;
  final data = e.response?.data;

  String message;
  if (data is Map<String, dynamic>) {
    if (data['errors'] is Map) {
      final errors = data['errors'] as Map<String, dynamic>;
      final first = errors.values.firstOrNull;
      if (first is List && first.isNotEmpty) {
        message = first.first.toString();
      } else if (first != null) {
        message = first.toString();
      } else if (data['message'] is String) {
        message = data['message'] as String;
      } else {
        message = _defaultMessageForCode(statusCode);
      }
    } else if (data['message'] is String) {
      message = data['message'] as String;
    } else if (data['ErrorMessage'] is String) {
      message = data['ErrorMessage'] as String;
    } else {
      message = _defaultMessageForCode(statusCode);
    }
  } else {
    message = _defaultMessageForCode(statusCode);
  }

  throw ServerException(
    errModel: ErrorModel(
      status: statusCode ?? 0,
      errorMessage: message,
    ),
  );
}

String _defaultMessageForCode(int? statusCode) {
  if (statusCode == null) return 'تعذر الاتصال بالخادم';
  if (statusCode >= 500) return 'حدث خطأ في الخادم، حاول لاحقاً';
  if (statusCode == 404) return 'المورد المطلوب غير موجود';
  if (statusCode == 403) return 'لا تملك صلاحية الوصول';
  if (statusCode == 401) return 'غير مصرح به';
  if (statusCode == 422) return 'بيانات غير صالحة';
  if (statusCode == 400) return 'طلب غير صالح';
  return 'حدث خطأ غير متوقع';
}
