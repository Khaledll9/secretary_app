import '../entities/add_course_entity.dart';
import '../repositories/add_course_repository.dart';

class AddCourseUseCase {
  final AddCourseRepository repository;

  const AddCourseUseCase(this.repository);

  Future<CreatedCourse> call(AddCourseEntity entity) async {
    return repository.addCourse(entity);
  }
}