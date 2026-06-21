import '../../domain/entities/course.dart';
import '../../domain/repositories/course_repository.dart';

class GetCourses {
  final CourseRepository repository;

  const GetCourses(this.repository);

  Future<List<Course>> call({String? category, int? departmentId}) async {
    if (departmentId != null) {
      return repository.getCoursesByDepartment(departmentId);
    }
    if (category != null) {
      return repository.getCoursesByCategory(category);
    }
    return repository.getCourses();
  }
}
