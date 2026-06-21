import '../entities/my_courses_course.dart';
import '../repositories/my_courses_repository.dart';

class GetCourses {
  final MyCoursesRepository repository;

  const GetCourses(this.repository);

  Future<List<MyCoursesCourse>> call() async {
    return repository.getCourses();
  }
}

class GetFilteredCourses {
  final MyCoursesRepository repository;

  const GetFilteredCourses(this.repository);

  Future<List<MyCoursesCourse>> call(int departmentId) async {
    return repository.getFilteredCourses(departmentId);
  }
}



