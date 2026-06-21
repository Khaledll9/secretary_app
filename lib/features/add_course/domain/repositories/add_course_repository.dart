import '../entities/add_course_entity.dart';

abstract class AddCourseRepository {
  Future<CreatedCourse> addCourse(AddCourseEntity entity);
}