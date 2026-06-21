import '../entities/my_courses_course.dart';

abstract class MyCoursesRepository {
  Future<List<MyCoursesCourse>> getCourses();
  Future<List<MyCoursesCourse>> getFilteredCourses(int departmentId);
}



