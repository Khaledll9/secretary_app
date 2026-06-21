import 'package:dio/dio.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/api/errors/exceptions.dart';
import '../../domain/entities/course.dart';
import '../../domain/repositories/course_repository.dart';
import '../models/course_model.dart';

class CourseRepositoryImpl implements CourseRepository {
  final ApiConsumer api;

  const CourseRepositoryImpl({required this.api});

  @override
  Future<List<Course>> getCourses() async {
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
  Future<List<Course>> getCoursesByCategory(String category) async {
    final allCourses = await getCourses();
    return allCourses.where((course) => course.category == category).toList();
  }

  @override
  Future<List<Course>> getCoursesByDepartment(int departmentId) async {
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

  Course _mapToEntity(CourseModel model) {
    final title = model.titleAr ??
        model.titleEn ??
        model.nameAr ??
        model.nameEn ??
        '';
    final description = model.descriptionAr ?? model.descriptionEn ?? '';
    final price = model.price ?? 0.0;
    final tag = model.department?.nameAr ?? model.department?.nameEn ?? '';
    final category = model.isActive == true ? 'دورة' : 'دبلوم';

    return Course(
      id: model.id,
      title: title,
      description: description,
      category: category,
      tag: tag,
      price: price,
      duration: model.duration,
      startDate: model.startDate,
      endDate: model.endDate,
      photoUrl: model.photoUrl,
      sessionsCount: model.stats?.length,
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
