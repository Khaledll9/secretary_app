import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../domain/entities/add_course_entity.dart';
import '../../domain/repositories/add_course_repository.dart';
import '../models/add_course_request_model.dart';
import '../models/add_course_response_model.dart';

class AddCourseRepositoryImpl implements AddCourseRepository {
  final ApiConsumer api;

  const AddCourseRepositoryImpl({required this.api});

  @override
  Future<CreatedCourse> addCourse(AddCourseEntity entity) async {
    final request = AddCourseRequestModel(
      titleAr: entity.titleAr,
      nameAr: entity.nameAr,
      descriptionAr: entity.descriptionAr,
      price: entity.price,
      duration: entity.duration,
      startDate: entity.startDate,
      endDate: entity.endDate,
      departmentId: entity.departmentId,
    );

    final response = await api.post(
      EndPoint.storeCourse,
      data: request.toJson(),
    );

    final courseResponse =
        AddCourseResponseModel.fromJson(response as Map<String, dynamic>);

    if (courseResponse.status != true || courseResponse.data == null) {
      final errorMessage = courseResponse.message ??
          courseResponse.errors?.values.expand((e) {
                if (e is List) return e;
                return [e.toString()];
              }).firstOrNull ??
          'فشل إضافة الكورس';
      throw Exception(errorMessage);
    }

    final data = courseResponse.data!;
    return CreatedCourse(
      id: data.id,
      titleAr: data.titleAr,
      nameAr: data.nameAr,
      descriptionAr: data.descriptionAr,
      price: data.price,
      duration: data.duration,
      startDate: data.startDate,
      endDate: data.endDate,
      departmentName: data.department?.nameAr,
    );
  }
}