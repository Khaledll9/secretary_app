import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../data/repositories/fake_my_courses_repository_impl.dart';
import '../../domain/entities/my_courses_course.dart';
import '../../domain/repositories/my_courses_repository.dart';
import '../../domain/usecases/get_my_courses_content.dart';

final getCoursesUseCaseProvider = Provider<GetCourses>((ref) {
  final repository = ref.watch(myCoursesRepositoryProvider);
  return GetCourses(repository);
});

final myCoursesProvider =
    StateNotifierProvider<MyCoursesNotifier, MyCoursesState>((ref) {
      final getCourses = ref.watch(getCoursesUseCaseProvider);
      return MyCoursesNotifier(getCourses);
    });

final myCoursesRepositoryProvider = Provider<MyCoursesRepository>((ref) {
  return FakeMyCoursesRepositoryImpl();
});

List<MyCoursesCourse> filterCourses(
  List<MyCoursesCourse> courses,
  MyCoursesFilter filter,
) {
  if (filter == MyCoursesFilter.all || filter == MyCoursesFilter.available) {
    return courses;
  }

  return courses.where((course) {
    if (filter == MyCoursesFilter.diplomas) {
      return course.category == 'دبلوم';
    }
    if (filter == MyCoursesFilter.courses) {
      return course.category == 'دورة';
    }
    return true;
  }).toList();
}

enum MyCoursesFilter { available, diplomas, courses, all }

class MyCoursesNotifier extends StateNotifier<MyCoursesState> {
  final GetCourses _getCourses;

  MyCoursesNotifier(this._getCourses) : super(const MyCoursesState()) {
    loadCourses();
  }

  Future<void> loadCourses() async {
    state = state.copyWith(courses: const AsyncValue.loading());

    try {
      final courses = await _getCourses();
      state = state.copyWith(courses: AsyncValue.data(courses));
    } catch (error, stackTrace) {
      state = state.copyWith(courses: AsyncValue.error(error, stackTrace));
    }
  }

  void selectFilter(MyCoursesFilter filter) {
    state = state.copyWith(selectedFilter: filter);
  }
}

class MyCoursesState {
  final MyCoursesFilter selectedFilter;
  final AsyncValue<List<MyCoursesCourse>> courses;

  const MyCoursesState({
    this.selectedFilter = MyCoursesFilter.available,
    this.courses = const AsyncValue.loading(),
  });

  MyCoursesState copyWith({
    MyCoursesFilter? selectedFilter,
    AsyncValue<List<MyCoursesCourse>>? courses,
  }) {
    return MyCoursesState(
      selectedFilter: selectedFilter ?? this.selectedFilter,
      courses: courses ?? this.courses,
    );
  }
}
