import '../entities/course.dart';

abstract class CourseRepository {
  Future<List<Course>> getCourses();
  Future<List<Course>> getCoursesByCategory(String category);
  Future<List<Course>> getCoursesByDepartment(int departmentId);
}
