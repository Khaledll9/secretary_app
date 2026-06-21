import 'package:dio/dio.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/api/errors/exceptions.dart';
import '../../domain/entities/my_courses_course.dart';
import '../../domain/repositories/my_courses_repository.dart';
import '../models/course_model.dart';

class MyCoursesRepositoryImpl implements MyCoursesRepository {
  final ApiConsumer api;

  const MyCoursesRepositoryImpl({required this.api});

  @override
  Future<List<MyCoursesCourse>> getCourses() async {
    try {
      final response = await api.get(EndPoint.viewCourses);
      final data = response[ApiKey.data] as List<dynamic>;
      return data.map((json) {
        final courseModel = CourseModel.fromJson(json as Map<String, dynamic>);
        return _mapToEntity(courseModel);
      }).toList();
    } on DioException catch (e) {
      handleDioExceptions(e);
      return [];
    }
  }

  @override
  Future<List<MyCoursesCourse>> getFilteredCourses(int departmentId) async {
    try {
      final response = await api.get(
        EndPoint.viewCourses,
        queryParameters: {ApiKey.departmentId: departmentId},
      );
      final data = response[ApiKey.data] as List<dynamic>;
      return data.map((json) {
        final courseModel = CourseModel.fromJson(json as Map<String, dynamic>);
        return _mapToEntity(courseModel);
      }).toList();
    } on DioException catch (e) {
      handleDioExceptions(e);
      return [];
    }
  }

  MyCoursesCourse _mapToEntity(CourseModel model) {
    final title = model.titleAr ??
        model.titleEn ??
        model.nameAr ??
        model.nameEn ??
        '';
    final description = model.descriptionAr ?? model.descriptionEn ?? '';
    final priceText = model.price != null ? '${model.price} ر.ي' : '';
    final tag = model.department?.nameAr ?? model.department?.nameEn ?? '';
    final category = model.isActive == true ? 'دورة' : 'دبلوم';

    return MyCoursesCourse(
      id: model.id,
      title: title,
      description: description,
      category: category,
      tag: tag,
      price: priceText,
      duration: model.duration,
      startDate: model.startDate,
      endDate: model.endDate,
      photoUrl: model.photoUrl,
      isActive: model.isActive,
      isAvailable: model.isAvailable,
      isLiked: model.isLiked,
      departmentName: model.department?.nameAr ?? model.department?.nameEn,
      instituteName:
          model.department?.institute?.nameAr ??
          model.department?.institute?.nameEn,
    );
  }
}
